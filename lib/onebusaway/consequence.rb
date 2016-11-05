require_relative 'base'

module OneBusAway
  class Consequence
    extend Collector

    attr_reader :condition,
                :condition_details

    def intialize(attributes)
      @condition         = attributes.try :[], 'condition'
      @condition_details = ConditionDetails.new attributes.try(:[], 'conditionDetails')
    end
  end
end
