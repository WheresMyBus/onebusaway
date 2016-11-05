require_relative 'base'

module OneBusAway
  class TripStopTime < Base
    extend Collector

    attr_reader :arrival_time,
                :departure_time,
                :stop_id

    def initialize(attributes)
      @stop_id        = attributes.try :[], 'stopId'
      @arrival_time   = get_time attributes.try(:[], 'arrivalTime')
      @departure_time = get_time attributes.try(:[], 'departureTime')
    end
  end
end
