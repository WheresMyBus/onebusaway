require_relative 'base'

module OneBusAway
  class BlockTrip < Base
    extend Collector

    attr_reader :accumulated_slack_time,
                :block_stop_times,
                :distance_along_block,
                :trip_id

    def initialize(attributes)
      @accumulated_slack_time = attributes['accumulatedSlackTime']
      @block_stop_times = BlockStopTime.collect attributes['blockStopTimes']
      @distance_along_block = attributes['distanceAlongBlock']
      @trip_id = attributes['tripId']
    end
  end
end
