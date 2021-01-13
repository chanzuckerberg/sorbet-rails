# typed: true
require("sorbet-rails/mailer_rbi_formatter")
require("sorbet-rails/job_rbi_formatter")

module SorbetRails
  class << self
    extend T::Sig

    sig { params(blk: T.proc.params(arg0: Config).void).void }
    def configure(&blk)
      yield config

      # After user has configured, register any plugins the user has added to
      # their configuration.
      register_configured_plugins
    end

    sig { returns(Config) }
    def config
      @_config ||= Config.new
    end

    sig { void }
    def register_configured_plugins
      config.enabled_plugins.each do |plugin_name|
        SorbetRails::ModelRbiFormatter.register_plugin_by_name(plugin_name)
      end
    end
  end

  class Config
    extend T::Sig

    sig { returns(T::Array[Symbol]) }
    attr_accessor :enabled_gem_plugins

    sig { returns(T::Array[Symbol]) }
    attr_accessor :enabled_model_plugins

    sig { returns(T::Array[String]) }
    attr_accessor :extra_helper_includes

    sig { returns(T.class_of(SorbetRails::JobRbiFormatter))}
    attr_accessor :job_generator_class

    sig { returns(T.class_of(SorbetRails::MailerRbiFormatter))}
    attr_accessor :mailer_generator_class

    sig { void }
    def initialize
      @enabled_gem_plugins = []
      @enabled_model_plugins = [
        :active_record_enum,
        :active_record_named_scope,
        :active_record_querying,
        :active_relation_where_not,
        :active_record_serialized_attribute,
        :active_record_attribute,
        :active_record_assoc,
        :custom_finder_methods,
        :enumerable_collections,
      ]
      @enabled_model_plugins << :active_storage_methods if defined?(T.unsafe(ActiveStorage))
      @extra_helper_includes = []
      @mailer_generator_class = SorbetRails::MailerRbiFormatter
      @job_generator_class = SorbetRails::JobRbiFormatter
    end

    sig { returns(T::Array[Symbol]) }
    def enabled_plugins
      @enabled_model_plugins + @enabled_gem_plugins
    end
  end
end
