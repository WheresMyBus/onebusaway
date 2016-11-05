module OneBusAway
  module Helpers
    def get_time(timestamp)
      DateTime.strptime timestamp.to_s.ljust(13, '0'), '%Q'
    end

    def get_date(timestamp)
      get_time(timestamp).to_date
    end

    def get_timestamp(time)
      time.to_i.to_s.ljust 13, '0'
    end

    def format_date(date)
      date.strftime '%Y-%m-%d'
    end
  end
end
