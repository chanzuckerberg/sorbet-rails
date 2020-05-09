# typed: strict
module SorbetRails
  if defined?(Rails)
    require 'sorbet-rails/railtie'
    require 'sorbet-rails/model_rbi_formatter'
    require 'sorbet-rails/type_assert/type_assert'
    require 'sorbet-rails/typed_params'
  end
end
