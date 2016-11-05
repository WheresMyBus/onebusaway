require_relative 'base'

module OneBusAway
  class BlockConfiguration < Base
    attr_reader :active_service_ids,
                :inactive_service_ids,
                :trips

    def initialize(attributes)
      @active_service_ids   = attributes.try :[], 'activeServiceIds'
      @inactive_service_ids = attributes.try :[], 'inactiveServiceIds'
      @trips                = BlockTrip.collect attributes.try(:[], 'trips')
    end
  end
end
