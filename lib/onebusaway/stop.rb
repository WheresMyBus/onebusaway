require_relative 'base'

module OneBusAway
  class Stop < Base
    attr_reader :code,
                :direction,
                :id,
                :location,
                :location_type,
                :name,
                :route_ids,
                :wheelchair_boarding

    def initialize(attributes)
      @code = attributes['code']
      @direction = attributes['direction']
      @id = attributes['id']
      @location = Location.new attributes
      @location_type = attributes['locationType']
      @name = attributes['name']
      @route_ids = attributes['routeIds']
      @wheelchair_boarding = attributes['wheelchairBoarding']
    end

    def self.collect(array)
      array.map { |attributes| new attributes }
    end
  end
end