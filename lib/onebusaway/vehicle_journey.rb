require_relative 'base'

module OneBusAway
  class VehicleJourney < Base
    extend Collector

    attr_reader :calls,
                :direction,
                :line_id

    def intialize(attributes)
      @calls = Call.collect attributes['calls']
      @direction = attributes['direction']
      @line_id = attributes['lineId']
    end
  end
end
