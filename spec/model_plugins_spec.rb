require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe SorbetRails::ModelPlugins do
  it 'can get & set plugins' do
    current = SorbetRails::ModelRbiFormatter.get_plugins
    expect(current).to include(
      SorbetRails::ModelPlugins::ActiveRecordEnum,
      SorbetRails::ModelPlugins::ActiveRecordNamedScope,
      SorbetRails::ModelPlugins::ActiveRecordQuerying,
      SorbetRails::ModelPlugins::ActiveRecordAttribute,
      SorbetRails::ModelPlugins::ActiveRecordAssoc,
    )
    expect(current).to include(MythicalRbiPlugin)

    SorbetRails::ModelRbiFormatter.set_plugins([MythicalRbiPlugin])
    new_plugins = SorbetRails::ModelRbiFormatter.get_plugins
    expect(new_plugins).to eql([MythicalRbiPlugin])

    SorbetRails::ModelRbiFormatter.set_plugins(current)
  end

  it 'does not add 1 plugin twice' do
    current = SorbetRails::ModelRbiFormatter.get_plugins
    expect(current).to include(MythicalRbiPlugin)

    SorbetRails::ModelRbiFormatter.register_plugin(MythicalRbiPlugin)
    new_plugins = SorbetRails::ModelRbiFormatter.get_plugins
    expect(new_plugins).to eql(current)
  end
end
