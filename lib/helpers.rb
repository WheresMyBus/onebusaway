module OneBusAway
  module Helpers
    def get_time(timestamp)
      DateTime.strptime timestamp.to_s.ljust(12, '0'), '%Q'
    end

    def get_date(timestamp)
      get_time(timestamp).to_date
    end
  end
end
