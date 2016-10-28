module OneBusAway
  module Collector
    def collect(array)
      array.map { |attributes| new attributes }
    end
  end
end
