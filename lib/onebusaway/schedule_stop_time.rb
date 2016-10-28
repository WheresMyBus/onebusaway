require_relative 'base'

module OneBusAway
  class ScheduleStopTime < Base
    extend Collector

    attr_reader :arrival_time,
                :departure_time,
                :service_id,
                :trip_id

    def initialize(attributes)
      @arrival_time = get_time attributes['arrivalTime']
      @departure_time = get_time attributes['departureTime']
      @serviceId = attributes['serviceId']
      @tripId = attributes['tripId']
    end
  end
end
