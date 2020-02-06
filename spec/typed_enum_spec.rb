require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe 'TypedEnum' do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
    )
  end

  it 'generates typed enum classes' do
    expect(Wizard.const_defined?(:House)).to be(true)
    expect(Wizard::House.constants).to match_array([
      :Gryffindor,
      :Hufflepuff,
      :Ravenclaw,
      :Slytherin,
    ])
    expect(Wizard::House::Gryffindor).to be_a(Wizard::House)
    expect(Wizard::House::Hufflepuff).to be_a(Wizard::House)
    expect(Wizard::House::Ravenclaw).to be_a(Wizard::House)
    expect(Wizard::House::Slytherin).to be_a(Wizard::House)
  end

  it 'can retrieve enum value correctly' do
    expect(harry.typed_house).to be(Wizard::House::Gryffindor)
    expect(harry.house).to eql('Gryffindor')
    expect(harry.Gryffindor?).to be(true)
    expect(harry.Slytherin?).to be(false)
  end

  it 'works when setting enum to nil' do
    harry.typed_house = nil
    expect(harry.typed_house).to be(nil)
    expect(harry.house).to be(nil)
    expect(harry.Gryffindor?).to be(false)
  end

  it 'works when setting enum value by typed_enum' do
    harry.typed_house = Wizard::House::Slytherin
    expect(harry.typed_house).to be(Wizard::House::Slytherin)
    expect(harry.house).to eql('Slytherin')
    expect(harry.Gryffindor?).to be(false)
    expect(harry.Slytherin?).to be(true)
  end

  it 'works when setting enum value by Rails setter' do
    harry.house = :Slytherin
    expect(harry.typed_house).to be(Wizard::House::Slytherin)
    expect(harry.house).to eql('Slytherin')
    expect(harry.Gryffindor?).to be(false)
    expect(harry.Slytherin?).to be(true)
  end
end
