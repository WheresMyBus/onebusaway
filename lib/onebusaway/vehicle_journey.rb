require_relative 'base'

module OneBusAway
  class VehicleJourney < Base
    extend Collector

    attr_reader :calls,
                :direction,
                :line_id

    def intialize(attributes)
      @direction = attributes.try :[], 'direction'
      @line_id   = attributes.try :[], 'lineId'
      @calls     = Call.collect attributes.try(:[], 'calls')
    end
  end
end
