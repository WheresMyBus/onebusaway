module OneBusAway
  class ArrivalAndDeparture
    attr_reader :arrival_enabled,
                :block_trip_sequence,
                :departure_enabled,
                :distance_from_stop,
                :frequency,
                :number_of_stops_away,
                :predicted,
                :predicted_arrival_time,
                :predicted_departure_time,
                :route_id,
                :route_long_name,
                :route_short_name,
                :scheduled_arrival_time,
                :scheduled_departure_time,
                :service_date,
                :stop_id,
                :stop_sequence,
                :trip_headsign,
                :trip_id,
                :trip_status

    def initialize(attributes)
      @arrival_enabled = attributes['arrivalEnabled']
      @block_trip_sequence = attributes['blockTripSequence']
      @departure_enabled = attributes['departureEnabled']
      @distance_from_stop = attributes['distanceFromStop']
      @frequency = attributes['frequency']
      @number_of_stops_away = attributes['numberofStopsAway']
      @predicted = attributes['predicted']
      @predicted_arrival_time = attributes['predictedArrivalTime']
      @predicted_departure_time = attributes['predictedDepartureTime']
      @route_id = attributes['routeId']
      @route_long_name = attributes['routeLongName']
      @route_short_name = attributes['routeShortName']
      @scheduled_arrival_time = attributes['scheduledArrivalTime'] # DateTime
      @scheduled_departure_time = attributes['scheduledDepartureTime'] # DateTime
      @service_date = attributes['serviceDate'] # Date
      @stop_id = attributes['stopId']
      @stop_sequence = attributes['stopSequence']
      @trip_headsign = attributes['tripHeadsign']
      @trip_id = attributes['tripId']
      @trip_status = attributes['tripStatus'] # TripStatus
    end
  end
end
