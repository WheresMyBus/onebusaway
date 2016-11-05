require_relative 'base'

module OneBusAway
  class ArrivalAndDeparture < Base
    extend Collector

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
                :stopSequence,
                :trip_headsign,
                :trip_id,
                :trip_status

    def initialize(attributes)
      @arrival_enabled          = attributes.try :[], 'arrivalEnabled'
      @block_trip_sequence      = attributes.try :[], 'blockTripSequence'
      @departure_enabled        = attributes.try :[], 'departureEnabled'
      @distance_from_stop       = attributes.try :[], 'distanceFromStop'
      @number_of_stops_away     = attributes.try :[], 'numberofStopsAway'
      @predicted                = attributes.try :[], 'predicted'
      @route_id                 = attributes.try :[], 'routeId'
      @route_long_name          = attributes.try :[], 'routeLongName'
      @route_short_name         = attributes.try :[], 'routeShortName'
      @stop_id                  = attributes.try :[], 'stopId'
      @stop_sequence            = attributes.try :[], 'stopSequence'
      @trip_headsign            = attributes.try :[], 'tripHeadsign'
      @trip_id                  = attributes.try :[], 'tripId'
      @predicted_arrival_time   = get_time attributes.try(:[], 'predictedArrivalTime')
      @predicted_departure_time = get_time attributes.try(:[], 'predictedDepartureTime')
      @scheduled_arrival_time   = get_time attributes.try(:[], 'scheduledArrivalTime')
      @scheduled_departure_time = get_time attributes.try(:[], 'scheduledDepartureTime')
      @service_date             = get_date attributes.try(:[], 'serviceDate')
      @frequency                = Frequency.new attributes.try(:[], 'frequency')
      @trip_status              = TripStatus.new attributes.try(:[], 'tripStatus')
    end
  end
end
