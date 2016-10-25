module OneBusAway
  class AgencyWithCoverage
    attr_reader :agency,
                :lat,
                :lon,
                :lat_span,
                :lon_span

    def initialize(agency, attributes)
      @agency = agency
      @lat = attributes['lat']
      @lon = attributes['lon']
      @lat_span = attributes['latSpan']
      @lon_span = attributes['lonSpan']
    end

    def self.collect(agencies, array)
      array.map do |attributes|
        agency = agencies.find { |a| a.id == attributes['agencyId'] }
        new agency, attributes
      end
    end
  end
end
