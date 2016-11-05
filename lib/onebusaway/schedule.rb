require_relative 'base'

module OneBusAway
  class Schedule < Base
    attr_reader :next_trip_id,
                :previous_trip_id,
                :stop_times,
                :time_zone

    def initialize(attributes)
      @next_trip_id     = attributes.try :[], 'nextTripId'
      @previous_trip_id = attributes.try :[], 'previousTripId'
      @time_zone        = attributes.try :[], 'timeZone'
      @stop_times       = TripStopTime.collect attributes.try(:[], 'stopTimes')
    end
  end
end
