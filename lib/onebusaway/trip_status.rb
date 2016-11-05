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
      @active_trip_id                = attributes.try :[], 'activeTripId'
      @block_trip_sequence           = attributes.try :[], 'blockTripSequence'
      @closest_stop                  = attributes.try :[], 'closestStop'
      @closest_stop_time_offset      = attributes.try :[], 'closestStopTimeOffset'
      @distance_along_trip           = attributes.try :[], 'disanceAlongTrip'
      @next_stop                     = attributes.try :[], 'nextStop'
      @last_known_orientation        = attributes.try :[], 'lastKnownOrientation'
      @next_stop_time_offset         = attributes.try :[], 'nextStopTimeOffset'
      @orientation                   = attributes.try :[], 'orientation'
      @phase                         = attributes.try :[], 'phase'
      @predicted                     = attributes.try :[], 'predicted'
      @scheulded_deviation           = attributes.try :[], 'scheduledDeviation'
      @scheduled_distance_along_trip = attributes.try :[], 'scheduledDistanceAlongTrip'
      @situation_ids                 = attributes.try :[], 'situationIds'
      @status                        = attributes.try :[], 'status'
      @total_distance_along_trip     = attributes.try :[], 'totalDistanceAlongTrip'
      @vehicle_id                    = attributes.try :[], 'vehicleId'
      @last_update_time              = get_time attributes.try(:[], 'lastUpdateTime')
      @service_date                  = get_date attributes.try(:[], 'serviceDate')
      @last_known_location           = Location.new attributes.try(:[], 'lastKnownLocation')
      @position                      = Location.new attributes.try(:[], 'position')
    end
  end
end
