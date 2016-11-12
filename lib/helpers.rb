module OneBusAway

  # Some convenient helper methods for managing dates and times
  module Helpers

    # Returns a DateTime object corresponding to the given timestamp.
    #
    # Params
    # - timestamp : a timestamp in either string or integer format
    def get_time(timestamp)
      DateTime.strptime timestamp.to_s.ljust(13, '0'), '%Q'
    end

    # Returns a Date object corresponding to the given timestamp.
    #
    # Params
    # - timestamp : a timestamp in either string or integer format
    def get_date(timestamp)
      get_time(timestamp).to_date
    end

    # Returns a timestamp corresponding to the given DateTime object.
    #
    # Params
    # - time : a DateTime object
    def get_timestamp(time)
      time.to_i.to_s.ljust 13, '0'
    end

    # Returns the given date in yyyy-mm-dd format.
    #
    # Params
    # - date : a Date object
    def format_date(date)
      date.strftime '%Y-%m-%d'
    end
  end
end
