require_relative 'base'

module OneBusAway
  class VehicleStatus < Base
    attr_reader :last_location_update_time,
                :last_update_time,
                :location,
                :trip_id,
                :trip_status,
                :vehicle_id

    def initialize(attributes)
      @last_location_update_time = get_time attributes['lastLocationUpdateTime']
      @last_update = get_time attributes['lastUpdateTime']
      @location = Location.new attributes['location']
      @trip_id = attributes['tripId']
      @trip_status = TripStatus.new attributes['tripStatus']
      @vehicle_id = attributes['vehicleId']
    end
  end
end
