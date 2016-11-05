require_relative 'base'

module OneBusAway
  class Situation < Base
    attr_reader :advice,
                :affects,
                :consequences,
                :creation_time,
                :description,
                :environment_reason,
                :id,
                :summary

    def initialize(attributes)
      @advice             = attributes.dig 'advice', 'value'
      @description        = attributes.dig 'description', 'value'
      @summary            = attributes.dig 'summary', 'value'
      @environment_reason = attributes.try :[], 'environmentReason'
      @id                 = attributes.try :[], 'id'
      @creation_time      = get_time attributes.try :[], 'creationTime'
      @consequences       = Consequence.collect attributes.try :[], 'consequences'
      @affects            = VehicleJourney.collect attributes.dig('affects', 'vehicleJourneys')
      @affects            += Stop.collect attributes.dig('affects', 'stops')
    end
  end
end
