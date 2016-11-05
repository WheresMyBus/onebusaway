require_relative 'base'

module OneBusAway
  class Trip < Base
    extend Collector

    attr_reader :direction_id,
                :id,
                :route_id,
                :service_id,
                :shape_id,
                :trip_headsign,
                :trip_short_name

    def initialize(attributes)
      @direction_id    = attributes.try :[], 'directionId'
      @id              = attributes.try :[], 'id'
      @route_id        = attributes.try :[], 'routeId'
      @service_id      = attributes.try :[], 'serviceId'
      @shape_id        = attributes.try :[], 'shapeId'
      @trip_headsign   = attributes.try :[], 'shapeHeadsign'
      @trip_short_name = attributes.try :[], 'tripShortName'
    end
  end
end
