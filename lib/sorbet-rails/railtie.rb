# typed: true
require "rails"
require "sorbet-runtime"
require "sorbet-rails/config"

class SorbetRails::Railtie < Rails::Railtie
  railtie_name "sorbet-rails"

  rake_tasks do
    path = File.expand_path(T.must(__dir__))
    Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
  end

  initializer "sorbet-rails.initialize" do
    ActiveSupport.on_load(:active_record) do
      require "sorbet-rails/rails_mixins/active_record_overrides"
      require "sorbet-rails/rails_mixins/custom_finder_methods"
      require "sorbet-rails/rails_mixins/pluck_to_tstruct"

      ActiveRecord::Base.extend SorbetRails::CustomFinderMethods
      ActiveRecord::Relation.include SorbetRails::CustomFinderMethods

      ActiveRecord::Base.extend SorbetRails::PluckToTStruct
      ActiveRecord::Relation.include SorbetRails::PluckToTStruct

      class ::ActiveRecord::Base
        # open ActiveRecord::Base to override inherited
        class << self
          alias_method :sbr_old_inherited, :inherited

          def inherited(child)
            sbr_old_inherited(child)
            # make the relation classes public so that they can be used for sorbet runtime checks
            child.send(:public_constant, :ActiveRecord_Relation)
            child.send(:public_constant, :ActiveRecord_AssociationRelation)
            child.send(:public_constant, :ActiveRecord_Associations_CollectionProxy)
          end
        end
      end
    end

    ActiveSupport.on_load(:action_controller) do
      require "sorbet-rails/rails_mixins/custom_params_methods"
      require "sorbet-rails/rails_mixins/generated_url_helpers"
      ActionController::Parameters.include SorbetRails::CustomParamsMethods
    end

    SorbetRails.register_configured_plugins
  end
end
