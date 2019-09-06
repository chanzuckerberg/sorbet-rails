require 'rails_helper'

describe SorbetRails::CustomParamsMethods do
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
      val = params.require_typed(:age, TI::Integer)
      expect(val).to eql(11)

      val = params.require_typed(:name, String.new)
      expect(val).to eql('Harry Potter')
    end

    it 'gets param object correctly' do
      val = params.require_typed(:info, ActionController::Parameters.new)
      expect(val.is_a?(ActionController::Parameters))
      expect(val).to eql(params_info)

      friends = val.require_typed(:friends, Array.new)
      expect(friends).to eql([
        'Hermione',
        'Ron',
      ])
    end

    it 'raises error when param doesnt exist' do
      expect {
        params.require_typed(:nonexistence, String.new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param is nil' do
      expect {
        info = params.require(:info)
        info.require_typed(:grandson, Array.new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param has wrong type' do
      expect {
        params.require_typed(:age, String.new)
      }.to raise_error(ActionController::BadRequest)
    end
  end

  context 'fetch_typed' do
    it 'gets basic param correctly' do
      val = params.fetch_typed(:age, TI::Integer)
      expect(val).to eql(11)

      val = params.fetch_typed(:name, String.new)
      expect(val).to eql('Harry Potter')
    end

    it 'gets param object correctly' do
      val = params.fetch_typed(:info, ActionController::Parameters.new)
      expect(val.is_a?(ActionController::Parameters))
      expect(val).to eql(params_info)

      friends = val.fetch_typed(:friends, Array.new)
      expect(friends).to eql([
        'Hermione',
        'Ron',
      ])
    end

    it 'raises error when param doesnt exist' do
      expect {
        val = params.fetch_typed(:nonexistence, String.new)
      }.to raise_error(ActionController::ParameterMissing)
    end

    it 'raises error when param has wrong type' do
      expect {
        val = params.fetch_typed(:age, String.new)
      }.to raise_error(ActionController::BadRequest)
    end

    it 'returns nil when param is nil' do
      grandson = params_info.fetch_typed(:grandson, Array.new)
      expect(grandson).to eql(nil)
    end

    context 'when there is a default value' do
      it 'uses default value when param is nil and has a default' do
        fetched = params.fetch_typed(:nonexistence, Array.new, [])
        expect(fetched).to eql([])
      end

      it 'ignores default value when there is a real value' do
        name = params.fetch_typed(:name, String.new, 'John Doe')
        expect(name).to eql('Harry Potter')
      end

      it 'converts hash default value into a params' do
        # this is `fetch` documented behavior
        fetched = params.fetch_typed(
          :nonexistence,
          ActionController::Parameters.new,
          { unknown: "baby" },
        )
        expect(fetched.is_a?(ActionController::Parameters)).to be(true)
        expect(fetched.permit(:unknown).to_h).to eql({ "unknown" => "baby" })
      end

      it 'raises error when param is nil and given a wrong default' do
        expect {
          fetched = params.fetch_typed(:nonexistence, Array.new, 5)
        }.to raise_error(ActionController::BadRequest)
      end
    end
  end
end
