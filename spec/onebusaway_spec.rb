require "spec_helper.rb"

RSpec.describe "OneBusAway" do
  it "gets route by id" do
    VCR.use_cassette("route") do
      route = OneBusAway.route("1_100300")
      expect(route.short_name).to eq("917")
    end
  end

  it "gets routes from agency by id" do
    VCR.use_cassette("routes_for_agency") do
      routes = OneBusAway.routes_for_agency(1)
      expect(routes.respond_to?("each")).to eq(true)
    end
  end
  
  it "gets stops by location" do
    VCR.use_cassette("stops_for_location") do
      location = { "key" => "TEST", "lat" => "47.653435", "lon" => "-122.305641"}
      stops = OneBusAway.stops_for_location(location)
      expect(stops.class).to eq(Array)
    end
  end

  it "gets trips for route by id" do
    VCR.use_cassette("trips_for_route") do
      trips = OneBusAway.trips_for_route("1_100300")
      expect(trips.class).to eq(Array)
    end
  end 
end
