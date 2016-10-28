require_relative 'base'

module OneBusAway
  class StopSchedule < Base
    attr_reader :date,
                :stop_calandar_days,
                :stop_id,
                :stop_route_schedules,
                :time_zone

    def initialize(attributes)
      @date = get_date attributes['date']
      @stop_calandar_days = StopCalandarDay.collect attributes['stopCalandarDays']
      @stop_id = attributes['stopId']
      @stop_route_schedules = StopRouteSchedule.collect attributes['stopRouteSchedules']
      @time_zone = attributes['timeZone']
    end
  end
end
