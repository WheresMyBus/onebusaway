require_relative 'base'

module OneBusAway
  class Location < Base
    attr_reader :lat, :lon

    def initialize(attributes)
      @lat = attributes['lat']
      @lon = attributes['lon']
    end

    def to_hash
      {
        'lat' => lat,
        'lon' => lon
      }
    end
  end
end
