module OneBusAway
  module Collector
    def collect(array)
      array.try(:map) { |attributes| new attributes } || []
    end
  end
end
