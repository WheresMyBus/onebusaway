module OneBusAway
  class VehicleStatus < Base
    attr_reader :last_location_update_time,
                :last_update_time,
                :location,
                :trip_id,
                :trip_status,
                :vehicle_id

    def initialize(location, trip_status, attributes)
      @last_location_update_time = get_time attributes['lastLocationUpdateTime']
      @last_update = get_time attributes['lastUpdateTime']
      @location = location
      @trip_id = attributes['tripId']
      @trip_status = trip_status
      @vehicle_id = attributes['vehicleId']
    end
  end
end
