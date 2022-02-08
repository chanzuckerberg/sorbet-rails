require 'rails_helper'

RSpec.describe SorbetRails::CustomFinderMethods do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
    )
  end
  let!(:ron) do
    Wizard.create!(
      name: 'Ron Weasley',
      house: :Gryffindor,
    )
  end
  let!(:hermione) do
    Wizard.create!(
      name: 'Hermione Granger',
      house: :Gryffindor,
    )
  end
  let!(:wizard_ids) { Wizard.all.pluck(:id) }

  context 'test find_n' do
    it 'works with array input' do
      with_array = Wizard.find_n(wizard_ids)
      expect(with_array.size).to eql(3)
    end

    it 'works with multiple ids' do
      with_splash = Wizard.find_n(*wizard_ids)
      expect(with_splash.size).to eql(3)
    end

    it 'works with empty array' do
      with_no_element = Wizard.find_n([])
      expect(with_no_element).to eql([])
    end

    it 'works with single id array' do
      with_one_element = Wizard.find_n([wizard_ids.first])
      expect(with_one_element.size).to eql(1)
    end

    it 'works with string ids' do
      with_array_string = Wizard.find_n(wizard_ids.map(&:to_s))
      expect(with_array_string.size).to eql(3)
    end
  end

  context 'test first_n' do
    it 'handles n = 1' do
      first_wizard = Wizard.order(:id).first_n(1)
      expect(first_wizard).to eq([harry])
    end

    it 'handles n > 1' do
      wizards_2 = Wizard.order(:id).first_n(2)
      expect(wizards_2).to eq([harry, ron])

      wizards_3 = Wizard.order(:id).first_n(3)
      expect(wizards_3).to eq([harry, ron, hermione])
    end
  end

  context 'test last_n' do
    it 'handles n = 1' do
      last_wizard = Wizard.order(:id).last_n(1)
      expect(last_wizard).to eq([hermione])
    end

    it 'handles n > 1' do
      wizards_2 = Wizard.order(:id).last_n(2)
      expect(wizards_2).to eq([ron, hermione])

      wizards_3 = Wizard.order(:id).first_n(3)
      expect(wizards_3).to eq([harry, ron, hermione])
    end
  end

  context 'test where_missing' do
    # where.missing is only available in Rails 6.1 and above
    if Rails.version < "6.1"
      it 'raises an error' do
        expect { Wizard.where_missing(:wand) }.to raise_error(NoMethodError)
      end
    else
      it 'works with no arguments' do
        missing_with_no_args = Wizard.where_missing
        all_wizards = Wizard.all

        expect(missing_with_no_args).to eq(all_wizards)
      end

      it 'retrieves wizards with missing wands' do
        elder_wand = Wand.create!(wizard: harry, wood_type: :holly, core_type: :phoenix_feather)
        wizards_without_wands = Wizard.where_missing(:wand).to_a

        expect(wizards_without_wands).to eq(Wizard.all.to_a - [harry])
      end
    end
  end
end
