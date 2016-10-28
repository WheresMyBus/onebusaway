require_relative 'base'

module OneBusAway
  class Schedule < Base
    attr_reader :next_trip_id,
                :previous_trip_id,
                :stop_times,
                :time_zone

    def initialize(attributes)
      @next_trip_id = attributes['nextTripId']
      @previous_trip_id = attributes['previousTripId']
      @stop_times = TripStopTime.collect attributes['stopTimes']
      @time_zone = attributes['timeZone']
    end
  end
end
