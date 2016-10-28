require_relative 'base'

module OneBusAway
  class ConditionDetails < Base
    attr_reader :diversion_path,
                :diversion_stop_ids

    def initialize(attributes)
      @diversion_path = DiversionPath.new attributes['diversionPath']
      @diversion_stop_ids = attributes['diversionStopIds']
    end
  end
end
