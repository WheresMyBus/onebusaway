require "spec_helper.rb"

RSpec.describe "OneBusAway" do
  it "Gets king county metro transit agency" do
    VCR.use_cassette("agency") do
      agency = OneBusAway.agency(1)
      expect(agency.name).to eq("Metro Transit")
    end
  end

  it "gets agencies with coverage" do
    VCR.use_cassette("agencies_with_coverage") do
      agencies = OneBusAway.agencies_with_coverage
      expect(agencies.respond_to?("each")).to eq(true)
    end
  end
end
