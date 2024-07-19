module Maistro
  class Configuration
    attr_accessor :debug_mode

    def initialize
      @debug_mode = false
    end

    def configure
      yield(self) if block_given?
    end
  end
end