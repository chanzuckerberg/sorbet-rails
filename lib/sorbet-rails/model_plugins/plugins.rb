# typed: true
require('sorbet-rails/model_plugins/base')
require('sorbet-rails/model_plugins/active_record_enum')
require('sorbet-rails/model_plugins/active_record_querying')
require('sorbet-rails/model_plugins/active_relation_where_not')
require('sorbet-rails/model_plugins/active_record_named_scope')
require('sorbet-rails/model_plugins/active_record_attribute')
require('sorbet-rails/model_plugins/active_record_assoc')
require('sorbet-rails/model_plugins/active_record_finder_methods')
require('sorbet-rails/model_plugins/custom_finder_methods')
require('sorbet-rails/model_plugins/enumerable_collections')

module SorbetRails::ModelPlugins
  extend T::Sig

  @@plugins = T.let(
    [
      ActiveRecordEnum,
      ActiveRecordNamedScope,
      ActiveRecordQuerying,
      ActiveRelationWhereNot,
      ActiveRecordAttribute,
      ActiveRecordAssoc,
      ActiveRecordFinderMethods,
      CustomFinderMethods,
      EnumerableCollections,
    ],
    T::Array[T.class_of(Base)]
  )

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
end
