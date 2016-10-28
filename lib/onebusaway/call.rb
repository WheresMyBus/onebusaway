require_relative 'base'

module OneBusAway
  class Call < Base
    extend Collector

    attr_reader :stop_id

    def initialize(attributes)
      @stop_id = attributes['stopId']
    end
  end
end
