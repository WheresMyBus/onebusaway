require_relative 'base'

module OneBusAway
  class StopTime < Base
    attr_reader :arrival_time,
                :departure_time,
                :drop_off_type,
                :pickup_type,
                :stop_id

    def intialize(attributes)
      @drop_off_type  = attributes.try :[], 'dropOffType'
      @pickup_type    = attributes.try :[], 'pickupType'
      @stop_id        = attributes.try :[], 'stopId'
      @arrival_time   = get_time attrixzbutes.try(:[], 'departureTime')
    end
  end
end
