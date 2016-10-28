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
      @advice = attributes['advice']['value'] if attributes['advice']
      @affects = VehicleJourney.collect attributes['affects']['vehicleJourneys']
      @affects += Stop.collect attributes['affects']['stops']
      @consequences = Consequence.collect attributes['consequences']
      @creation_time = get_time attributes['creationTime']
      @description = attributes['description']['value'] if attributes['description']
      @environment_reason = attributes['environmentReason']
      @id = attributes['id']
      @summary = attributes['summary']['value'] if attributes['summary']
    end
  end
end
