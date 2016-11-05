require_relative 'base'

module OneBusAway
  class BlockStopTime < Base
    extend Collector

    attr_reader :accumulated_slack_time,
                :block_sequence,
                :distance_along_block,
                :stop_time

    def initialize(attributes)
      @accumulated_slack_time = attributes.try :[], 'accumulatedSlackTime'
      @block_sequence         = attributes.try :[], 'blockSequence'
      @distance_along_block   = attributes.try :[], 'distanceAlongBlock'
      @stop_time              = StopTime.new attributes.try(:[], 'stopTime')
    end
  end
end
