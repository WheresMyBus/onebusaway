require_relative 'base'

module OneBusAway
  class StopCalandarDay < Base
    extend Collector

    attr_reader :date,
                :group

    def initialize(attributes)
      @date  = get_date attributes.try(:[], 'date')
      @group = attributes.try :[], 'group'
    end
  end
end
