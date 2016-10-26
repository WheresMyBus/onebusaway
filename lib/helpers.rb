module OneBusAway
  module Helpers
    def get_time(timestamp)
      DateTime.strptime timestamp, '%s'
    end
  end
end
