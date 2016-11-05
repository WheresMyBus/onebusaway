require_relative 'base'

module OneBusAway
  class StopSchedule < Base
    attr_reader :date,
                :stop_calandar_days,
                :stop_id,
                :stop_route_schedules,
                :time_zone

    def initialize(attributes)
      @stop_id              = attributes.try :[], 'stopId'
      @time_zone            = attributes.try :[], 'timeZone'
      @date                 = get_date attributes.try(:[], 'date')
      @stop_calandar_days   = StopCalandarDay.collect attributes.try(:[], 'stopCalandarDays')
      @stop_route_schedules = StopRouteSchedule.collect attributes.try(:[], 'stopRouteSchedules')
    end
  end
end
