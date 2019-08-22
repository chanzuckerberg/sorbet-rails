# typed: true
require('sorbet-rails/config')

module SorbetRails::GemPlugins
  extend T::Sig

  sig { void }
  def self.register_gem_plugins
    if SorbetRails.config.enabled_gem_plugins.include?(:kaminari)
      require('sorbet-rails/gem_plugins/kaminari_plugin')
      SorbetRails::ModelRbiFormatter.register_plugin(KaminariPlugin)
    end
  end
end
