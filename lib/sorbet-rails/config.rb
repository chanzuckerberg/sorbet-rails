# typed: true
module SorbetRails
  class << self
    def configure
      yield config
    end
    
    def config
      @_config ||= Config.new
    end
  end
  
  class Config
    extend T::Sig

    attr_accessor :enabled_gem_plugins

    sig { void }
    def initialize
      @enabled_gem_plugins = []
    end
  end
end
