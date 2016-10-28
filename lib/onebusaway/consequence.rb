require_relative 'base'

module OneBusAway
  class Consequence
    extend Collector

    attr_reader :condition,
                :condition_details

    def intialize(attributes)
      @condition = attributes['condition']
      @condition_details = ConditionDetails.new attributes['conditionDetails'] if attributes['conditionDetails']
    end
  end
end
