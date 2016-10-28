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
      @direction_id = attributes['directionId']
      @id = attributes['id']
      @route_id = attributes['routeId']
      @service_id = attributes['serviceId']
      @shape_id = attributes['shapeId']
      @trip_headsign = attributes['shapeHeadsign']
      @trip_short_name = attributes['tripShortName']
    end
  end
end
