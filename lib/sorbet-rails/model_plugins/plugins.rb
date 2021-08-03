# typed: strict
require('sorbet-rails/model_plugins/base')
require('sorbet-rails/model_plugins/active_record_enum')
require('sorbet-rails/model_plugins/active_record_querying')
require('sorbet-rails/model_plugins/active_relation_where_not')
require('sorbet-rails/model_plugins/active_record_named_scope')
require('sorbet-rails/model_plugins/active_record_attribute')
require('sorbet-rails/model_plugins/active_record_assoc')
require('sorbet-rails/model_plugins/active_record_serialized_attribute')
require('sorbet-rails/model_plugins/custom_finder_methods')
require('sorbet-rails/model_plugins/enumerable_collections')
require('sorbet-rails/model_plugins/active_storage_methods')

module SorbetRails::ModelPlugins
  extend T::Sig
  include Kernel

  @@plugins = T.let([], T::Array[T.class_of(Base)])

  sig { params(plugin: T.class_of(Base)).void }
  def register_plugin(plugin)
    @@plugins.push(plugin) unless @@plugins.include?(plugin)
  end

  sig { params(plugins: T::Array[T.class_of(Base)]).void }
  def set_plugins(plugins)
    @@plugins = plugins
  end

  sig { returns(T::Array[T.class_of(Base)]) }
  def get_plugins
    @@plugins
  end

  sig { params(plugin_name: Symbol).void }
  def register_plugin_by_name(plugin_name)
    register_plugin(get_plugin_by_name(plugin_name))
  end

  sig { params(plugin_name: Symbol).returns(T.class_of(Base)) }
  def get_plugin_by_name(plugin_name)
    case plugin_name
    when :active_record_enum
      ActiveRecordEnum
    when :active_record_named_scope
      ActiveRecordNamedScope
    when :active_record_querying
      ActiveRecordQuerying
    when :active_relation_where_not
      ActiveRelationWhereNot
    when :active_record_serialized_attribute
      ActiveRecordSerializedAttribute
    when :active_record_attribute
      ActiveRecordAttribute
    when :active_record_assoc
      ActiveRecordAssoc
    when :custom_finder_methods
      CustomFinderMethods
    when :enumerable_collections
      EnumerableCollections
    when :active_storage_methods
      ActiveStorageMethods
    when :kaminari
      require('sorbet-rails/gem_plugins/kaminari_plugin')
      KaminariPlugin
    when :pg_search
      require('sorbet-rails/gem_plugins/pg_search_plugin')
      PgSearchPlugin
    when :friendly_id
      require('sorbet-rails/gem_plugins/friendly_id_plugin')
      FriendlyIdPlugin
    when :shrine
      require('sorbet-rails/gem_plugins/shrine_plugin')
      ShrinePlugin
    when :elastic_search
      require('sorbet-rails/gem_plugins/elastic_search_plugin')
      ElasticSearchPlugin
    when :active_flag
      require('sorbet-rails/gem_plugins/active_flag_plugin')
      ActiveFlagPlugin
    when :paperclip
      require('sorbet-rails/gem_plugins/paperclip_plugin')
      PaperclipPlugin
    when :attr_json
      require('sorbet-rails/gem_plugins/attr_json_plugin')
      AttrJsonPlugin
    when :flag_shih_tzu
      require('sorbet-rails/gem_plugins/flag_shih_tzu_plugin')
      FlagShihTzuPlugin
    when :aasm
      require('sorbet-rails/gem_plugins/aasm_plugin')
      AasmPlugin
    when :money_rails
      require('sorbet-rails/gem_plugins/money_rails_plugin')
      MoneyRailsPlugin
    else
      raise UnrecognizedPluginName.new(
        "Unrecognized plugin with name: #{plugin_name}. Please check available plugins in the
        documentation".squish!
      )
    end
  end

  class UnrecognizedPluginName < StandardError; end
end
