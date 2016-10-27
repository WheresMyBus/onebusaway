module OneBusAway
  module Helpers
    def get_time(timestamp)
      DateTime.strptime timestamp.to_s, '%Q'
    end
  end
end
