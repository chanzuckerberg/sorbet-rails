require 'rails_helper'
require 'sorbet-rails/custom_types/boolean_string'
require 'sorbet-runtime'

RSpec.describe BooleanString do
  shared_examples 'boolean string' do |str|
    it 'acts as BooleanString perfectly' do
      expect(str.is_a?(BooleanString)).to be(true)
      expect(str.kind_of?(BooleanString)).to be(true)
      expect(str.instance_of?(BooleanString)).to be(true)
      expect(BooleanString === str).to be(true)
    end
  end

  include_examples 'boolean string', 'true'
  include_examples 'boolean string', 'false'
  include_examples 'boolean string', 'True'
  include_examples 'boolean string', 'False'

  shared_examples 'non boolean string' do |str|
    it 'does not acts as BooleanString' do
      expect(str.is_a?(BooleanString)).to be(false)
      expect(str.kind_of?(BooleanString)).to be(false)
      expect(str.instance_of?(BooleanString)).to be(false)
      expect(BooleanString === str).to be(false)
    end
  end

  include_examples 'non boolean string', 'yes'
  include_examples 'non boolean string', 'no'
  include_examples 'non boolean string', 'alala'

  context 'sorbet recognizes it at runtime' do
    it 'lets boolean string pass runtime check' do
      expect(T.let('true', BooleanString)).to eql('true')
    end

    it 'doesnt let normal string pass runtime typecheck' do
      expect {
        T.let('yes', BooleanString)
      }.to raise_error(TypeError)
    end
  end

  context 'using with TypeAssert' do
    let!(:ta) { TA[BooleanString].new }

    it 'lets boolean string pass runtime typecheck' do
      expect(ta.assert('true')).to eql('true')
    end

    it 'doesnt let normal string pass runtime typecheck' do
      expect {
        ta.assert('yes')
      }.to raise_error(TypeError)
    end
  end
end

