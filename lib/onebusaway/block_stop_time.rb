require_relative 'base'

module OneBusAway
  class BlockStopTime < Base
    extend Collector

    attr_reader :accumulated_slack_time,
                :block_sequence,
                :distance_along_block,
                :stop_time

    def initialize(attributes)
      @accumulated_slack_time = attributes['accumulatedSlackTime']
      @block_sequence = attributes['blockSequence']
      @distance_along_block = attributes['distanceAlongBlock']
      @stop_time = StopTime.new attributes['stopTime']
    end
  end
end
