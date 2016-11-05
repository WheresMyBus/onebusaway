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
      @situation_ids = attributes.try :[], 'situationIds'
      @trip_id       = attributes.try :[], 'tripId'
      @service_date  = get_date attributes.try(:[], 'serviceDate')
      @frequency     = Frequency.new attributes.try(:[], 'frequency')
      @schedule      = Schedule.new attributes.try(:[], 'schedule')
      @status        = TripStatus.new attributes.try(:[], 'status')
    end
  end
end
