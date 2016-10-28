require_relative 'base'

module OneBusAway
  class TripStatus < Base
    attr_reader :active_trip_id,
                :block_trip_sequence,
                :closest_stop,
                :closest_stop_time_offset,
                :distance_along_trip,
                :last_known_location,
                :last_known_orientation,
                :last_location_update_time,
                :last_update_time,
                :next_stop,
                :next_stop_time_offset,
                :orientation,
                :phase,
                :position,
                :predicted,
                :scheduled_deviation,
                :scheduled_distance_along_trip,
                :service_date,
                :situation_ids,
                :status,
                :total_distance_along_trip,
                :vehicle_id

    def initialize(attributes)
      @active_trip_id = attributes['activeTripId']
      @block_trip_sequence = attributes['blockTripSequence']
      @closest_stop = attributes['closestStop']
      @closest_stop_time_offset = attributes['closestStopTimeOffset']
      @distance_along_trip = attributes['disanceAlongTrip']
      @last_known_location = Location.new attributes['lastKnownLocation'] if attributes['lastKnownLocation']
      @last_known_orientation = attributes['lastKnownOrientation']
      @last_update_time = get_time attributes['lastUpdateTime']
      @next_stop = attributes['nextStop']
      @next_stop_time_offset = attributes['nextStopTimeOffset']
      @orientation = attributes['orientation']
      @phase = attributes['phase']
      @position = Location.new attributes['position'] if attributes['position']
      @predicted = attributes['predicted']
      @scheulded_deviation = attributes['scheduledDeviation']
      @scheduled_distance_along_trip = attributes['scheduledDistanceAlongTrip']
      @service_date = get_date attributes['serviceDate']
      @situation_ids = attributes['situationIds']
      @status = attributes['status']
      @total_distance_along_trip = attributes['totalDistanceAlongTrip']
      @vehicle_id = attributes['vehicleId']
    end
  end
end
