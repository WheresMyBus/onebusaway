require_relative 'base'

module OneBusAway
  class RegisteredAlarm < Base
    attr_reader :alarm_id

    def initialize(attributes)
      @alarm_id = attributes.try :[], 'alarmId'
    end
  end
end
