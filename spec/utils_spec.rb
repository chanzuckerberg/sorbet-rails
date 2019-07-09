require 'rails_helper'
require 'sorbet-rails/utils'

RSpec.describe SorbetRails::Utils do
  it 'loads all the models in the app' do
    expected_models = [
      Potion,
      SpellBook,
      Wand,
      Wizard,
    ]

    if Object.const_defined?('ActiveStorage')
      expected_models += [
        ActiveStorage::Attachment,
        ActiveStorage::Blob,
      ]
    end

    SorbetRails::Utils.rails_eager_load_all!
    all_models = ActiveRecord::Base.descendants
    expect((expected_models - all_models)).to eql([])
  end
end
