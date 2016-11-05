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
      Agency.new response.dig('data', 'entry')
    end

    def agencies_with_coverage
      response = request 'agencies-with-coverage'
      agencies = referenced_agencies response
      AgencyWithCoverage.collect agencies, response.dig('data', 'list')
    end

    def arrival_and_departure_for_stop(id,
                                       trip_id,
                                       service_date,
                                       vehicle_id: nil,
                                       stop_sequence: nil,
                                       time: nil)
      options = {}
      options['tripId'] = trip_id
      options['serviceDate'] = get_timestamp service_date
      options['vehicleId'] = vehicle_id if vehicle_id
      options['stopSequence'] = stop_sequence if stop_sequence
      options['time'] = get_timestamp time if time

      response = request "arrival-and-departure-for-stop/#{id}", options
      ArrivalAndDeparture.new response.dig('data', 'entry')
    end

    def arrivals_and_departures_for_stop(id,
                                         minutes_before: nil,
                                         minutes_after: nil,
                                         time: nil)
      options = {}
      options['minutesBefore'] = minutes_before if minutes_before
      options['minutesAfter'] = minutes_after if minutes_after
      options['time'] = get_timestamp time if time

      response = request "arrivals-and-departures-for-stop/#{id}", options
      ArrivalAndDeparture.collect response.dig('data', 'entry', 'arrivalsAndDepartures')
    end

    def cancel_alarm(id)
      reqest "cancel-alarm/#{id}"
    end

    def current_time
      response = request 'current-time'
      get_time response.dig('data', 'entry', 'time')
    end

    def register_alarm_for_arrival_and_departure_at_stop(id,
                                                         trip_id,
                                                         service_date,
                                                         vehicle_id,
                                                         stop_sequence,
                                                         url,
                                                         alarm_time_offset: nil,
                                                         on_arrival: false)
      options = {}
      options['tripId'] = trip_id
      options['serviceDate'] = get_timestamp service_date
      options['vehicleId'] = vehicle_id
      options['stopSequence'] = stop_sequence
      options['url'] = url
      options['alarmTimeOffset'] = alarm_time_offset if alarm_time_offset
      options['onArrival'] = on_arrival

      response = request "register-alarm-for-arrival-and-departure-at-stop/#{id}", options
      RegisteredAlarm.new response.dig('data', 'entry')
    end

    def report_problem_with_stop(stop_id,
                                 code: nil,
                                 user_comment: nil,
                                 user_location: nil,
                                 user_location_accuracy: nil)
      options = {}
      options['code'] = code if code
      options['userComment'] = user_comment if user_comment
      options['userLat'] = user_location.lat if user_location
      options['userLon'] = user_location.lon if user_location
      options['userLocationAccuracy'] = user_location_accuracy if user_location_accuracy

      request "report-problem-with-stop/#{stop_id}", options
    end

    def report_problem_with_trip(trip_id,
                                 service_date: nil,
                                 vehicle_id: nil,
                                 stop_id: nil,
                                 code: nil,
                                 user_comment: nil,
                                 user_on_vehicle: nil,
                                 user_vehicle_number: nil,
                                 user_location: nil,
                                 user_location_accuracy: nil)
      options = {}
      options['serviceDate'] = get_timestamp service_date if service_date
      options['vehicleId'] = vehicle_id if vehicle_id
      options['stopId'] = stop_id if stop_id
      options['code'] = code if code
      options['userComment'] = user_comment if user_comment
      options['userOnVehicle'] = user_on_vehicle
      options['userVehicleNumber'] = user_vehicle_number if user_vehicle_number
      options['userLat'] = user_location.lat if user_location
      options['userLon'] = user_location.lon if user_location
      options['userLocationAccuracy'] = user_location_accuracy if user_location_accuracy

      request "report-problem-with-trip/#{trip_id}", options
    end

    def route(id)
      response = request "route/#{id}"
      Route.new response.dig('data', 'entry')
    end

    def routes_for_agency(id)
      response = request "routes-for-agency/#{id}"
      Route.collect response.dig('data', 'list')
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
      Route.collect response.dig('data', 'list')
    end

    def route_ids_for_agency(id)
      response = request "route-ids-for-agency/#{id}"
      response.dig('data', 'list')
    end

    def schedule_for_stop(id,
                          date: nil)
      options = {}
      options['date'] = format_date date if date

      response = request "schedule-for-stop/#{id}"
      StopSchedule.new response.dig('data', 'entry')
    end

    def shape(id)
      response = request "shape/#{id}"
      Shape.new response.dig('data', 'entry')
    end

    def stop(id)
      response = request "stop/#{id}"
      Stop.new response.dig('data', 'entry')
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
      Stop.collect response.dig('data', 'list')
    end

    def stop_ids_for_agency(id)
      response = request "stop-ids-for-agency/#{id}"
      response.dig('data', 'list')
    end

    def stops_for_route(id)
      response = request "stops-for-route/#{id}"
      response.dig('data', 'entry', 'stopIds')
    end

    def trip(id)
      response = request "trip/#{id}"
      Trip.new response.dig('data', 'entry')
    end

    def trip_details(id,
                     service_date: nil,
                     include_trip: true,
                     include_schedule: true,
                     include_status: true,
                     time: nil)
      options = {}
      options['serviceDate'] = get_timestamp service_date if service_date
      options['includeTrip'] = include_trip
      options['includeSchedule'] = include_schedule
      options['includeStatus'] = include_status
      options['time'] = get_timestamp time if time

      response = request "trip-details/#{id}"
      TripDetails.new response.dig('data', 'entry')
    end

    def trips_for_location(location,
                           span: nil,
                           include_trips: false,
                           include_schedules: false,
                           time: nil)
      options = location.to_hash
      options.merge! span.to_hash if span
      options['includeTrips'] = include_trips
      options['includeSchedules'] = include_schedules
      options['time'] = get_timestamp time if time

      response = request 'trips-for-location'
      TripDetails.collect response.dig('data', 'list')
    end

    def trips_for_route(id,
                        include_status: false,
                        include_schedules: false,
                        time: nil)
      options = {}
      options['includeStatus'] = include_status
      options['includeSchedules'] = include_schedules
      options['time'] = get_timestamp time if time

      response = request "trips-for-route/#{id}"
      TripDetails.collect response.dig('data', 'list')
    end

    def trip_for_vehicle(id,
                         include_trip: false,
                         include_schedule: false,
                         include_status: true,
                         time: nil)
      options = {}
      options['includeTrip'] = include_trip
      options['includeSchedule'] = include_schedule
      options['includeStatus'] = include_status
      options['time'] = get_timestamp time if time

      response = request "trip-for-vehicle/#{id}"
      TripDetails.new response.dig('data', 'entry')
    end

    def vehicles_for_agency(id, time: nil)
      options = {}
      options['time'] = get_timestamp time if time

      response = request "vehicles-for-agency/#{id}", options
      VehicleStatus.collect response.dig('data', 'list')
    end

    private

    BASE_URL = 'http://api.onebusaway.org/api/where/'.freeze

    def request(call, options = {})
      options['key'] = @api_key || 'TEST'
      response = HTTParty.get "#{BASE_URL}#{call}.json", query: options
      JSON.parse response.body
    end

    def references(response, type = nil)
      references = response.dig('data', 'references')
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
