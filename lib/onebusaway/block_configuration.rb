require_relative 'base'

module OneBusAway
  class BlockConfiguration < Base
    attr_reader :active_service_ids,
                :inactive_service_ids,
                :trips

    def initialize(attributes)
      @active_service_ids = attributes['activeServiceIds']
      @inactive_service_ids = attributes['inactiveServiceIds']
      @trips = BlockTrip.collect attributes['trips']
    end
  end
end
