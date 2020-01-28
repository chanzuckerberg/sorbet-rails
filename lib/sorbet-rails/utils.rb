# typed: false

module SorbetRails::Utils
  extend T::Sig

  sig { void }
  def self.rails_eager_load_all!
    # need to eager load to see all models
    Rails.configuration.eager_load_namespaces.each { |ns| ns.try(:eager_load!) }
    # Rails 6.0 change the loading logic to use Zeitwerk
    # https://github.com/rails/rails/blob/master/railties/lib/rails/application/finisher.rb#L116
    # But this is not applied to Rails.application.eager_load! method
    Zeitwerk::Loader.eager_load_all if defined?(Zeitwerk)
    # Let's eager_load more stuff so that we have the full picture of the runtime environment.
    # Also only applicable to Rails 6.
    if Rails.respond_to?(:autoloaders)
      Rails.autoloaders.each(&:eager_load)
    end
  end

  sig { params(method_name: String).returns(T::Boolean) }
  def self.valid_method_name?(method_name)
    !!method_name.match(/^[A-z][A-z0-9_]*[!?=]?$/)
  end
end
