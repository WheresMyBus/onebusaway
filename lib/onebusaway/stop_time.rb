require_relative 'base'

module OneBusAway
  class StopTime < Base
    attr_reader :arrival_time,
                :departure_time,
                :drop_off_type,
                :pickup_type,
                :stop_id

    def intialize(attributes)
      @arrival_time = get_time attributes['arrivalTime']
      @departure_time = get_time attributes['departureTime']
      @drop_off_type = attributes['dropOffType']
      @pickup_type = attributes['pickupType']
      @stop_id = attributes['stopId']
    end
  end
end
