require 'rails_helper'

describe ActionController::Parameters do
  let!(:params) do
    ActionController::Parameters.new({
      age: 11,
      name: 'Harry Potter',
      info: {
        birthday: Date.parse('1980-07-31'),
        friends: [
          'Hermione',
          'Ron',
        ],
        grandson: nil,
      },
    })
  end
  let!(:params_info) { params.require(:info) }

  context 'require_typed' do
    it 'gets basic param correctly' do
      val = params.require_typed(:age, TA[Integer].new)
      expect(val).to eql(11)

      val = params.require_typed(:name, TA[String].new)
      expect(val).to eql('Harry Potter')
    end

    it 'gets param with complex type correctly' do
      val = params.require_typed(:age, TA[T.any(String, Integer)].new)
      expect(val).to eql(11)
    end

    it 'gets param object correctly' do
      val = params.require_typed(:info, TA[ActionController::Parameters].new)
      expect(val.is_a?(ActionController::Parameters))
      expect(val).to eql(params_info)

      friends = val.require_typed(:friends, TA[T::Array[String]].new)
      expect(friends).to eql([
        'Hermione',
        'Ron',
      ])
    end

    it 'raises error when param doesnt exist' do
      expect {
        params.require_typed(:nonexistence, TA[String].new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param is nil' do
      expect {
        params_info.require_typed(:grandson, TA[T::Array[String]].new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param has wrong type' do
      expect {
        params.require_typed(:age, TA[String].new)
      }.to raise_error(ActionController::BadRequest)
    end

    it 'raises error when param has wrong complex type' do
      expect {
        params.require_typed(:age, TA[T::Array[String]].new)
      }.to raise_error(ActionController::BadRequest)
    end
  end

  context 'fetch_typed' do
    it 'gets basic param correctly' do
      val = params.fetch_typed(:age, TA[Integer].new)
      expect(val).to eql(11)

      val = params.fetch_typed(:name, TA[String].new)
      expect(val).to eql('Harry Potter')
    end

    it 'gets param object correctly' do
      val = params.fetch_typed(:info, TA[ActionController::Parameters].new)
      expect(val.is_a?(ActionController::Parameters))
      expect(val).to eql(params_info)

      friends = val.fetch_typed(:friends, TA[T::Array[String]].new)
      expect(friends).to eql([
        'Hermione',
        'Ron',
      ])
    end

    it 'raises error when param doesnt exist' do
      expect {
        val = params.fetch_typed(:nonexistence, TA[String].new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param has wrong type' do
      expect {
        val = params.fetch_typed(:age, TA[String].new)
      }.to raise_error(ActionController::BadRequest)
    end

    it 'returns nil when param is nil' do
      grandson = params_info.fetch_typed(:grandson, TA[T.nilable(T::Array[String])].new)
      expect(grandson).to eql(nil)
    end

    context 'when there is a default value' do
      it 'uses default value when param is nil and has a default' do
        fetched = params.fetch_typed(:nonexistence, TA[T::Array[String]].new, [])
        expect(fetched).to eql([])
      end

      it 'ignores default value when there is a real value' do
        name = params.fetch_typed(:name, TA[String].new, 'John Doe')
        expect(name).to eql('Harry Potter')
      end

      it 'converts hash default value into a params' do
        # this is `fetch` documented behavior
        fetched = params.fetch_typed(
          :nonexistence,
          TA[ActionController::Parameters].new,
          { unknown: "baby" },
        )
        expect(fetched.is_a?(ActionController::Parameters)).to be(true)
        expect(fetched.permit(:unknown).to_h).to eql({ "unknown" => "baby" })
      end

      it 'raises error when param is nil and given a wrong default' do
        expect {
          fetched = params.fetch_typed(:nonexistence, TA[T::Array].new, 5)
        }.to raise_error(ActionController::BadRequest)
      end
    end
  end
end
