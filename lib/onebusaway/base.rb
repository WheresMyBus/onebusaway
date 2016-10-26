require 'date'

module OneBusAway
  class Base
    private

    def get_time(timestamp)
      DateTime.strptime(timestamp, '%s')
    end
  end
end
