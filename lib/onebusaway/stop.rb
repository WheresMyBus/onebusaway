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
      @location = nil # fix
      @location_type = location_type
      @name = name
      @route_ids = route_ids
      @wheelchair_boarding = wheelchair_boarding
    end
  end
end
