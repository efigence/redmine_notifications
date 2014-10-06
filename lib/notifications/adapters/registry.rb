module Notifications
  class AdapterRegistry

    attr_reader :registerd_adapters
    attr_reader :registerd_adapters_symbols

    def initialize
      @registerd_adapters = []
      @registerd_adapters_symbols = []
    end

    def register(adapter, symbol)
      @registerd_adapters << adapter
      @registerd_adapters_symbols << symbol
    end

    def [](id)
      if id.kind_of?(Symbol)
        @registerd_adapters[@registerd_adapters_symbols.index(id)]
      else
        @registerd_adapters[id]
      end
    end
  end
end
