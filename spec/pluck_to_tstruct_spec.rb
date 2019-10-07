require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe SorbetRails::PluckToTStruct do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
    )
  end

  let!(:hermione) do
    Wizard.create!(
      name: 'Hermione Granger',
      house: :Gryffindor,
    )
  end

  class WizardName < T::Struct
    const :name, String

    def ==(other)
      return false unless other.is_a?(self.class)
      name == other.name
    end

    def eql?(other)
      self == other
    end
  end

  class WizardT < T::Struct
    const :name, String
    const :house, String

    def ==(other)
      return false unless other.is_a?(self.class)
      name == other.name && house == other.house
    end

    def eql?(other)
      self == other
    end
  end

  shared_examples 'pluck_to_tstruct' do |struct_type, expected_values|
    it 'plucks correctly from ActiveRecord model' do
      plucked = Wizard.pluck_to_tstruct(TA[struct_type].new)
      expect(plucked).to match_array(expected_values)
    end

    it 'plucks correctly from ActiveRecord relation' do
      plucked = Wizard.all.pluck_to_tstruct(TA[struct_type].new)
      expect(plucked).to match_array(expected_values)
    end
  end

  context 'pluck 1 attribute' do
    it_should_behave_like 'pluck_to_tstruct', WizardName, [
      WizardName.new(name: "Harry Potter"),
      WizardName.new(name: "Hermione Granger"),
    ]
  end

  context 'pluck multiple attributes' do
    it_should_behave_like 'pluck_to_tstruct', WizardT, [
      WizardT.new(name: "Harry Potter", house: "Gryffindor"),
      WizardT.new(name: "Hermione Granger", house: "Gryffindor"),
    ]
  end
end
