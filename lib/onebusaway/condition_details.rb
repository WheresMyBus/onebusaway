require_relative 'base'

module OneBusAway
  class ConditionDetails < Base
    attr_reader :diversion_path,
                :diversion_stop_ids

    def initialize(attributes)
      @diversion_stop_ids = attributes.try :[], 'diversionStopIds'
      @diversion_path     = DiversionPath.new attributes.try(:[], 'diversionPath')
    end
  end
end
