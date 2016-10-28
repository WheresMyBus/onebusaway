require_relative 'base'

module OneBusAway
  class TripDetails < Base
    extend Collector

    attr_reader :frequency,
                :schedule,
                :service_date,
                :situation_ids,
                :status,
                :trip_id

    def initialize(attributes)
      @frequency = Frequency.new attributes['frequency'] if attributes['frequency']
      @schedule = Schedule.new attributes['schedule']
      @service_date = get_date attributes['serviceDate']
      @situation_ids = attributes['situationIds']
      @status = TripStatus.new attributes['status'] if attributes['status']
      @trip_id = attributes['tripId']
    end
  end
end
