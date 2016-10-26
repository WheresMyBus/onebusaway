require_relative 'base'

module OneBusAway
  class AgencyWithCoverage < Base
    attr_reader :agency,
                :location,
                :lat_span,
                :lon_span

    def initialize(agency, attributes)
      @agency = agency
      @location = Location.new attributes
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
