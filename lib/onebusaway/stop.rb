require_relative 'base'

module OneBusAway
  class Stop < Base
    extend Collector

    attr_reader :code,
                :direction,
                :id,
                :location,
                :location_type,
                :name,
                :route_ids,
                :wheelchair_boarding

    def initialize(attributes)
      @code                = attributes.try :[], 'code'
      @direction           = attributes.try :[], 'direction'
      @id                  = attributes.try :[], 'id'
      @location_type       = attributes.try :[], 'locationType'
      @name                = attributes.try :[], 'name'
      @route_ids           = attributes.try :[], 'routeIds'
      @wheelchair_boarding = attributes.try :[], 'wheelchairBoarding'
      @location            = Location.new attributes
    end
  end
end
