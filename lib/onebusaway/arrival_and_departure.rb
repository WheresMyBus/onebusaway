require_relative 'base'

module OneBusAway
  class ArrivalAndDeparture < Base
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

    def initialize(attributes, frequency, trip_status)
      @arrival_enabled = attributes['arrivalEnabled']
      @block_trip_sequence = attributes['blockTripSequence']
      @departure_enabled = attributes['departureEnabled']
      @distance_from_stop = attributes['distanceFromStop']
      @frequency = frequency
      @number_of_stops_away = attributes['numberofStopsAway']
      @predicted = attributes['predicted']
      @predicted_arrival_time = get_time attributes['predictedArrivalTime']
      @predicted_departure_time = get_time attributes['predictedDepartureTime']
      @route_id = attributes['routeId']
      @route_long_name = attributes['routeLongName']
      @route_short_name = attributes['routeShortName']
      @scheduled_arrival_time = get_time attributes['scheduledArrivalTime']
      @scheduled_departure_time = get_time attributes['scheduledDepartureTime']
      @service_date = get_time(attributes['serviceDate']).to_date
      @stop_id = attributes['stopId']
      @stop_sequence = attributes['stopSequence']
      @trip_headsign = attributes['tripHeadsign']
      @trip_id = attributes['tripId']
      @trip_status = trip_status
    end
  end
end
