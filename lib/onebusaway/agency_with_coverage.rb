require_relative 'base'

module OneBusAway
  class AgencyWithCoverage < Base
    attr_reader :agency,
                :location,
                :span

    def initialize(agency, attributes)
      @agency = agency
      @location = Location.new attributes
      @span = Span.new attributes
    end

    def self.collect(agencies, array)
      array.map do |attributes|
        agency = agencies.find { |a| a.id == attributes['agencyId'] }
        new agency, attributes
      end
    end
  end
end
