# typed: true
module SorbetRails
  class << self
    extend T::Sig
    
    sig { params(blk: T.proc.params(arg0: Config).void).void }
    def configure(&blk)
      yield config
    end

    sig { returns(Config) }
    def config
      @_config ||= Config.new
    end
  end
  
  class Config
    extend T::Sig

    sig { returns(T::Array[Symbol]) }
    attr_accessor :enabled_gem_plugins

    sig { void }
    def initialize
      @enabled_gem_plugins = []
    end
  end
end
