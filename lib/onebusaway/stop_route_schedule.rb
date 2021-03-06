require_relative 'base'

module OneBusAway
  class StopRouteSchedule < Base
    extend Collector

    attr_reader :route_id,
                :stop_route_direction_schedule

    def initialize(attributes)
      @route_id                     = attributes.try :[], 'routeId'
      @stop_route_direction_schdule = StopRouteDirectionSchedule.collect attributes.try(:[], 'stopRouteDirectionSchedule')
    end
  end
end
