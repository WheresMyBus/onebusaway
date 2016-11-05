require_relative 'base'

module OneBusAway
  class VehicleStatus < Base
    extend Collector

    attr_reader :last_location_update_time,
                :last_update_time,
                :location,
                :trip_id,
                :trip_status,
                :vehicle_id

    def initialize(attributes)
      @trip_id                   = attributes.try :[], 'tripId'
      @vehicle_id                = attributes.try :[], 'vehicleId'
      @last_location_update_time = get_time attributes.try(:[], 'lastLocationUpdateTime')
      @last_update               = get_time attributes.try(:[], 'lastUpdateTime')
      @location                  = Location.new attributes.try(:[], 'location')
      @trip_status               = TripStatus.new attributes.try(:[], 'tripStatus')
    end
  end
end
