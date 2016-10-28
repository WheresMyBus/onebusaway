require_relative 'base'

module OneBusAway
  class StopRouteDirectionSchedule < Base
    extend Collector

    attr_reader :schedule_stop_times,
                :trip_headsign

    def initializer(attributes)
      @schedule_stop_times = ScheduleStopTime.collect attributes['scheduleStopTimes']
      @trip_headsign = attributes['tripHeadsign']
    end
  end
end
