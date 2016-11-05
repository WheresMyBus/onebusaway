require_relative 'base'

module OneBusAway
  class StopRouteDirectionSchedule < Base
    extend Collector

    attr_reader :schedule_stop_times,
                :trip_headsign

    def initializer(attributes)
      @trip_headsign       = attributes.try :[], 'tripHeadsign'
      @schedule_stop_times = ScheduleStopTime.collect attributes.try(:[], 'scheduleStopTimes')
    end
  end
end
