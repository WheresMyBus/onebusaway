require_relative 'base'

module OneBusAway
  class Frequency < Base
    attr_reader :end_time,
                :headway,
                :start_time

    def initialize(attributes)
      @headway    = attributes.try :[], 'headway'
      @end_time   = get_time attributes.try(:[], 'endTime')
      @start_time = get_time attributes.try(:[], 'startTime')
    end
  end
end
