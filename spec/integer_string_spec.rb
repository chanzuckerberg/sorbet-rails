require 'rails_helper'
require 'sorbet-rails/custom_types/integer_string'
require 'sorbet-runtime'

RSpec.describe IntegerString do
  it 'lets integer string acts as IntegerString perfectly' do
    expect('1'.is_a?(IntegerString)).to be(true)
    expect('12'.kind_of?(IntegerString)).to be(true)
    expect('123'.instance_of?(IntegerString)).to be(true)
    expect(IntegerString === '1234').to be(true)
  end

  it 'does not let other string acts as IntegerString' do
    expect('a1'.is_a?(IntegerString)).to be(false)
    expect('a12'.kind_of?(IntegerString)).to be(false)
    expect('a123'.instance_of?(IntegerString)).to be(false)
    expect(IntegerString === 'a1234').to be(false)
  end

  context 'sorbet recognizes it at runtime' do
    it 'lets integer string pass runtime check' do
      expect(T.let('123', IntegerString)).to eql('123')
    end

    it 'doesnt let normal string pass runtime typecheck' do
      expect {
        T.let('a123', IntegerString)
      }.to raise_error(TypeError)
    end
  end

  context 'using with TypeAssert' do
    let!(:ta) { TA[IntegerString].new }

    it 'lets integer string pass runtime typecheck' do
      expect(ta.assert('123')).to eql('123')
    end

    it 'doesnt let normal string pass runtime typecheck' do
      expect {
        ta.assert('a123')
      }.to raise_error(TypeError)
    end
  end
end

