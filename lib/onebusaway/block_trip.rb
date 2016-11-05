require_relative 'base'

module OneBusAway
  class BlockTrip < Base
    extend Collector

    attr_reader :accumulated_slack_time,
                :block_stop_times,
                :distance_along_block,
                :trip_id

    def initialize(attributes)
      @accumulated_slack_time = attributes.try :[], 'accumulatedSlackTime'
      @distance_along_block   = attributes.try :[], 'distanceAlongBlock'
      @trip_id                = attributes.try :[], 'tripId'
      @block_stop_times       = BlockStopTime.collect attributes.try(:[], 'blockStopTimes')
    end
  end
end
