require_relative 'base'

module OneBusAway
  class ScheduleStopTime < Base
    extend Collector

    attr_reader :arrival_time,
                :departure_time,
                :service_id,
                :trip_id

    def initialize(attributes)
      @serviceId      = attributes.try :[], 'serviceId'
      @tripId         = attributes.try :[], 'tripId'
      @arrival_time   = get_time attributes.try(:[], 'arrivalTime')
      @departure_time = get_time attributes.try(:[], 'departureTime')
    end
  end
end
