require_relative 'base'

module OneBusAway
  class Frequency < Base
    attr_reader :end_time,
                :headway,
                :start_time

    def initialize(attributes)
      @end_time = attributes['endTime']
      @headway = attributes['headway']
      @start_time = attributes['startTime']
    end
  end
end
