# typed: strong
module SorbetRails
  if defined?(Rails)
    require 'sorbet-rails/railtie'
    require 'sorbet-rails/model_rbi_formatter'
  end
end
