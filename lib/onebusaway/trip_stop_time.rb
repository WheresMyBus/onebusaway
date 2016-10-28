require_relative 'base'

module OneBusAway
  class TripStopTime < Base
    extend Collector

    attr_reader :arrival_time,
                :departure_time,
                :stop_id

    def initialize(attributes)
      @arrival_time = get_time attributes['arrivalTime']
      @departure_time = get_time attributes['departureTime']
      @stop_id = attributes['stopId']
    end
  end
end
