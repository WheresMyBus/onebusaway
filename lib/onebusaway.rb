require 'httparty'
Dir[__dir__ + '/onebusaway/*.rb'].each do |file|
  require file
end

module OneBusAway
  class << self
    include Helpers

    attr_writer :api_key

    def agency(id)
      response = request "agency/#{id}"
      Agency.new response['data']['entry']
    end

    def agencies_with_coverage
      response = request 'agencies-with-coverage'
      agencies = referenced_agencies response
      AgencyWithCoverage.collect agencies, response['data']['list']
    end

    # def arrivals_and_departures_for_stop(id,
    #                                      minutes_before = nil,
    #                                      minutes_after = nil,
    #                                      time = nil)
    #   options = {}
    #   options['minutesBefore'] = minutes_before if minutes_before
    #   options['minutesAfter'] = minutes_after if minutes_after
    #   options['time'] = time.to_i if time

    #   response = request "arrivals-and-departures-for-stop/#{id}", options

    #   puts response.inspect
    # end

    def current_time
      response = request 'current-time'
      get_time response['data']['entry']['time']
    end

    def route(id)
      response = request "route/#{id}"
      Route.new response['data']['entry']
    end

    def routes_for_agency(id)
      response = request "routes-for-agency/#{id}"
      Route.collect response['data']['list']
    end

    def routes_for_location(location,
                            radius: nil,
                            span: nil,
                            query: nil)
      options = location.to_hash
      options['radius'] = radius if radius
      options.merge! span.to_hash if span
      options['query'] = query if query

      response = request 'routes-for-location', options
      Route.collect response['data']['list']
    end

    def route_ids_for_agency(id)
      response = request "route-ids-for-agency/#{id}"
      response['data']['list']
    end

    def shape(id)
      response = request "shape/#{id}"
      Shape.new response['data']['entry']
    end

    def stop(id)
      response = request "stop/#{id}"
      Stop.new response['data']['entry']
    end

    def stops_for_location(location,
                           radius: nil,
                           span: nil,
                           query: nil)
      options = location.to_hash
      options['radius'] = radius if radius
      options.merge! span.to_hash if span
      options['query'] = query if query

      response = request 'stops-for-location', options
      Stop.collect response['data']['list']
    end

    def stop_ids_for_agency(id)
      response = request "stop-ids-for-agency/#{id}"
      response['data']['list']
    end

    def stop_ids_for_route(id)
      response = request "stops-for-route/#{id}"
      response['data']['entry']['stopIds']
    end

    def trip(id)
      response = request "trip/#{id}"
      Trip.new response['data']['entry']
    end

    def vehicles_for_agency(id, time: nil)
      options = {}
      options['time'] = time.to_i * 1000 if time

      response = request "vehicles-for-agency/#{id}", options
      VehicleStatus.collect response['data']['list']
    end

    private

    BASE_URL = 'http://api.onebusaway.org/api/where/'.freeze

    def request(call, options = {})
      options[:key] = @api_key || 'TEST'
      response = HTTParty.get "#{BASE_URL}#{call}.json", query: options
      JSON.parse response.body
    end

    def references(response, type = nil)
      references = response['data']['references']
      references.fetch type, references
    end

    def referenced_objects(response)
      {
        'agencies' => referenced_agencies(response),
        'routes' => referenced_routes(response),
        'stops' => referenced_stops(response),
        'trips' => referenced_trips(response)
      }
    end

    def referenced_agencies(response)
      Agency.collect references(response, 'agencies')
    end

    def referenced_routes(response)
      Route.collect references(response, 'routes')
    end

    def referenced_stops(response)
      Stop.collect references(response, 'stops')
    end

    def referenced_trips(response)
      Trip.collect references(response, 'trips')
    end
  end
end
