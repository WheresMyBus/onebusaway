require 'httparty'
Dir[__dir__ + '/onebusaway/*.rb'].each do |file|
  require file
end

# A wrapper around the OneBusAway REST API.
module OneBusAway
  class << self
    include Helpers

    # Sets the OneBusAway API key to be sent along with each request.
    attr_writer :api_key

    # # Returns an Agency object with the given id.
    # #
    # # Params
    # # - id : an agency id
    # def agency(id)
    #   response = request "agency/#{id}"
    #   Agency.new response.dig('data', 'entry')
    # end

    # # Returns an array of AgencyWithCoverage objects.
    # def agencies_with_coverage
    #   response = request 'agencies-with-coverage'
    #   agencies = referenced_agencies response
    #   AgencyWithCoverage.collect agencies, response.dig('data', 'list')
    # end

    # # Get info about a single arrival and departure for a stop.
    # #
    # # Params
    # # - id : the stop id
    # # - trip_id : the trip id of the arriving transit vehicle
    # # - service_date : the service date of the arriving transit vehicle
    # # - vehicle_id [optional] : the vehicle id of the arriving transit vehicle
    # # - stop_sequence [optional] : the stop sequence index of the stop in the transit vehicle's
    # #                              trip
    # # - time [optional] : a specific time in the past to get data about
    # def arrival_and_departure_for_stop(id,
    #                                    trip_id,
    #                                    service_date,
    #                                    vehicle_id: nil,
    #                                    stop_sequence: nil,
    #                                    time: nil)
    #   options = {}
    #   options['tripId'] = trip_id
    #   options['serviceDate'] = get_timestamp service_date
    #   options['vehicleId'] = vehicle_id if vehicle_id
    #   options['stopSequence'] = stop_sequence if stop_sequence
    #   options['time'] = get_timestamp time if time

    #   response = request "arrival-and-departure-for-stop/#{id}", options
    #   ArrivalAndDeparture.new response.dig('data', 'entry')
    # end

    # # Get current arrivals and departures for a stop identified by id.
    # #
    # # Params
    # # - id : the stop id
    # # - minutes_before [optional] : include vehicles having arrived or departed in the previous n
    # #                               minutes
    # # - minutes_after [optional] :  include vehicles arriving or departing in the next n minutes
    # # - time [optional] : a specific time in the past to get data about
    # def arrivals_and_departures_for_stop(id,
    #                                      minutes_before: nil,
    #                                      minutes_after: nil,
    #                                      time: nil)
    #   options = {}
    #   options['minutesBefore'] = minutes_before if minutes_before
    #   options['minutesAfter'] = minutes_after if minutes_after
    #   options['time'] = get_timestamp time if time

    #   response = request "arrivals-and-departures-for-stop/#{id}", options
    #   ArrivalAndDeparture.collect response.dig('data', 'entry', 'arrivalsAndDepartures')
    # end

    # # Cancel a registered alarm.
    # #
    # # Params
    # # - id : the alarm id
    # def cancel_alarm(id)
    #   reqest "cancel-alarm/#{id}"
    # end

    # # Retrieve the current system time.
    # def current_time
    #   response = request 'current-time'
    #   get_time response.dig('data', 'entry', 'time')
    # end

    # # Register an alarm for a single arrival and departure at a stop, with a callback URL to be
    # # requested when the alarm is fired.
    # #
    # # Params
    # # - id : the stop id
    # # - trip_id : the trip id of the arriving transit vehicle
    # # - service_date : the service date of the arriving transit vehicle
    # # - vehicle_id : the vehicle id of the arriving transit vehicle
    # # - stop_sequence : the stop sequence index of the stop in the transit vehicle's trip
    # # - url : callback URL that will be requested when the alarm is fired long before the
    # #         arrival/departure the alarm will be fired
    # # - on_arrivate [optional] : set to true to indicate the alarm should be fired relative to
    # #                            vehicle arrival
    # def register_alarm_for_arrival_and_departure_at_stop(id,
    #                                                      trip_id,
    #                                                      service_date,
    #                                                      vehicle_id,
    #                                                      stop_sequence,
    #                                                      url,
    #                                                      alarm_time_offset: nil,
    #                                                      on_arrival: false)
    #   options = {}
    #   options['tripId'] = trip_id
    #   options['serviceDate'] = get_timestamp service_date
    #   options['vehicleId'] = vehicle_id
    #   options['stopSequence'] = stop_sequence
    #   options['url'] = url
    #   options['alarmTimeOffset'] = alarm_time_offset if alarm_time_offset
    #   options['onArrival'] = on_arrival

    #   response = request "register-alarm-for-arrival-and-departure-at-stop/#{id}", options
    #   RegisteredAlarm.new response.dig('data', 'entry')
    # end

    # # Submit a user-generated problem report for a particular stop.
    # #
    # # Params
    # # - stop_id : the stop id
    # # - code [optional] : a string code identifying the nature of the problem
    # #   - stop_name_wrong : the stop name in OneBusAway differs from the actual stop's name
    # #   - stop_number_wrong : the stop number in OneBusAway differs from the actual stop's number
    # #   - stop_location_wrong : the stop location in OneBusAway differs from the actual stop's
    # #                           location
    # #   - route_or_trip_missing : an expected route or trip is missing from the stop
    # #   - other - catch-all for everything else
    # # - user_comment [optional] : additional comment text supplied by the user describing the
    # #                             problem
    # # - user_location [optional] : the reporting user's current location
    # # - user_location_accuracy [optional] : the reporting user’s location accuracy, in meters
    # def report_problem_with_stop(stop_id,
    #                              code: nil,
    #                              user_comment: nil,
    #                              user_location: nil,
    #                              user_location_accuracy: nil)
    #   options = {}
    #   options['code'] = code if code
    #   options['userComment'] = user_comment if user_comment
    #   options['userLat'] = user_location.lat if user_location
    #   options['userLon'] = user_location.lon if user_location
    #   options['userLocationAccuracy'] = user_location_accuracy if user_location_accuracy

    #   request "report-problem-with-stop/#{stop_id}", options
    # end

    # # Submit a user-generated problem report for a particular trip.
    # #
    # # Params
    # # - trip_id : the stop id
    # # - service_date [optional] : the service date of the trip
    # # - vehicle_id [optional] : the vehicle actively serving the trip
    # # - stop_id [optional] : the stop id indicating the stop where the user is experiencing the
    # #                        problem
    # # - code [optional] : a string code identifying the nature of the problem
    # #   - vehicle_never_came
    # #   - vehicle_came_early : the vehicle arrived earlier than predicted
    # #   - vehicle_came_late : the vehicle arrived later than predicted
    # #   - wrong_headsign : the headsign reported by OneBusAway differed from the vehicle’s actual
    # #                      headsign
    # #   - vehicle_does_not_stop_here : the trip in question does not actually service the indicated
    # #                                  stop
    # #   - other : catch-all for everythign else
    # # - user_comment [optional] : additional comment text supplied by the user describing the
    # #                             problem
    # # - user_on_vehicle [optional] : true/false to indicate if the user is on the transit vehicle
    # #                                experiencing the problem
    # # - user_vehicle_number [optional] : the vehicle number, as reported by the user
    # # - user_location [optional] : the reporting user's current location
    # # - user_location_accuracy [optional] : the reporting user’s location accuracy, in meters
    # def report_problem_with_trip(trip_id,
    #                              service_date: nil,
    #                              vehicle_id: nil,
    #                              stop_id: nil,
    #                              code: nil,
    #                              user_comment: nil,
    #                              user_on_vehicle: nil,
    #                              user_vehicle_number: nil,
    #                              user_location: nil,
    #                              user_location_accuracy: nil)
    #   options = {}
    #   options['serviceDate'] = get_timestamp service_date if service_date
    #   options['vehicleId'] = vehicle_id if vehicle_id
    #   options['stopId'] = stop_id if stop_id
    #   options['code'] = code if code
    #   options['userComment'] = user_comment if user_comment
    #   options['userOnVehicle'] = user_on_vehicle
    #   options['userVehicleNumber'] = user_vehicle_number if user_vehicle_number
    #   options['userLat'] = user_location.lat if user_location
    #   options['userLon'] = user_location.lon if user_location
    #   options['userLocationAccuracy'] = user_location_accuracy if user_location_accuracy

    #   request "report-problem-with-trip/#{trip_id}", options
    # end

    # Retrieve info for a specific route by id.
    #
    # Params
    # - id : the id of the route
    def route(id)
      response = request "route/#{id}"
      Route.new response.dig('data', 'entry')
    end

    # Retrieve the list of all routes for a particular agency by id.
    #
    # Params
    # - id : the id of the agency
    def routes_for_agency(id)
      response = request "routes-for-agency/#{id}"
      Route.collect response.dig('data', 'list')
    end

    # # Search for routes near a specific location, optionally by name.
    # #
    # # Params
    # # - location : the location of the search center
    # # - radius [optional] : the search radius in meters
    # # - span [optional] : an alternative to radius to set the search bounding box
    # # - query [optional] : a specific route short name to search for
    # def routes_for_location(location,
    #                         radius: nil,
    #                         span: nil,
    #                         query: nil)
    #   options = location.to_hash
    #   options['radius'] = radius if radius
    #   options.merge! span.to_hash if span
    #   options['query'] = query if query

    #   response = request 'routes-for-location', options
    #   Route.collect response.dig('data', 'list')
    # end

    # # Retrieve the list of all route ids for a particular agency.
    # #
    # # Params
    # # - id : the id of the agency
    # def route_ids_for_agency(id)
    #   response = request "route-ids-for-agency/#{id}"
    #   response.dig('data', 'list')
    # end

    # # Retrieve the full schedule for a stop on a particular day.
    # #
    # # Params
    # # - id : the stop id to request the schedule for
    # # - date [optional] : the date for which you want to request a schedule of the format
    # #                     YYYY-MM-DD
    # def schedule_for_stop(id,
    #                       date: nil)
    #   options = {}
    #   options['date'] = format_date date if date

    #   response = request "schedule-for-stop/#{id}", options
    #   StopSchedule.new response.dig('data', 'entry')
    # end

    # # Retrieve a shape (the path traveled by a transit vehicle) by id.
    # #
    # # Params
    # # - id : the shape id
    # def shape(id)
    #   response = request "shape/#{id}"
    #   Shape.new response.dig('data', 'entry')
    # end

    # # Retrieve info for a specific stop by id.
    # #
    # # Params
    # # - id : the id of the requested stop
    # def stop(id)
    #   response = request "stop/#{id}"
    #   Stop.new response.dig('data', 'entry')
    # end

    # Search for stops near a specific location, optionally by stop code
    #
    # Params
    # - location : the location of the search center
    # - radius [optional] : the search radius in meters
    # - span [optional] : an alternative to radius to set the search bounding box
    # - query [optional] : a specific stop code to search for
    # - include_routes [optional] : include referenced routes
    def stops_for_location(location,
                           radius: nil,
                           span: nil,
                           query: nil,
                           include_routes: false)
      options = location.to_hash
      options['radius'] = radius if radius
      options.merge! span.to_hash if span
      options['query'] = query if query

      response = request 'stops-for-location', options
      stops = Stop.collect response.dig('data', 'list')

      if include_routes
        [stops, referenced_routes(response)]
      else
        stops
      end
    end

    # # Retrieve the list of all stops for a particular agency by id
    # #
    # # Params
    # # - id : the id of the agency
    # def stop_ids_for_agency(id)
    #   response = request "stop-ids-for-agency/#{id}"
    #   response.dig('data', 'list')
    # end

    # # Retrieve the set of stops serving a particular route, including groups by direction of
    # # travel.
    # #
    # # Params
    # # - id : the route id
    # def stops_for_route(id)
    #   response = request "stops-for-route/#{id}"
    #   response.dig('data', 'entry', 'stopIds')
    # end

    # # Get details of a specific trip by id.
    # #
    # # Params
    # # - id : the id of the trip
    # def trip(id)
    #   response = request "trip/#{id}"
    #   Trip.new response.dig('data', 'entry')
    # end

    # # Get extended details for a specific trip.
    # #
    # # Params
    # # - id : the id of the trip
    # # - service_date [optional] : the service date for the trip as unix-time in ms
    # # - include_trip [optional] : set whether the trip data is included
    # # - include_schedule [optional] : set whether the schedule data is included
    # # - include_status [optional] : set whether the status data is included
    # # - time [optional] : a specific time in the past to get data about
    # def trip_details(id,
    #                  service_date: nil,
    #                  include_trip: true,
    #                  include_schedule: true,
    #                  include_status: true,
    #                  time: nil)
    #   options = {}
    #   options['serviceDate'] = get_timestamp service_date if service_date
    #   options['includeTrip'] = include_trip
    #   options['includeSchedule'] = include_schedule
    #   options['includeStatus'] = include_status
    #   options['time'] = get_timestamp time if time

    #   response = request "trip-details/#{id}", options
    #   TripDetails.new response.dig('data', 'entry')
    # end

    # # Search for active trips near a specific location.
    # #
    # # Params
    # # - location : the location of the search center
    # # - span [optional] : set the limits of the search bounding box
    # # - include_trips [optional] : set whether the trip data is included
    # # - include_schedules [optional] : set whether the schedule data is included
    # # - time [optional] : a specific time in the past to get data about
    # def trips_for_location(location,
    #                        span: nil,
    #                        include_trips: false,
    #                        include_schedules: false,
    #                        time: nil)
    #   options = location.to_hash
    #   options.merge! span.to_hash if span
    #   options['includeTrips'] = include_trips
    #   options['includeSchedules'] = include_schedules
    #   options['time'] = get_timestamp time if time

    #   response = request 'trips-for-location', options
    #   TripDetails.collect response.dig('data', 'list')
    # end

    # Search for active trips for a specific route.
    #
    # Params
    # - id : the id of the route
    # - include_status [optional] : set whether the status data is included
    # - include_schedules [optional] : set whether the schedule data is included
    # - time [optional] : a specific time in the past to get data about
    def trips_for_route(id,
                        include_status: false,
                        include_schedules: false,
                        time: nil)
      options = {}
      options['includeStatus'] = include_status
      options['includeSchedules'] = include_schedules
      options['time'] = get_timestamp time if time

      response = request "trips-for-route/#{id}", options
      TripDetails.collect response.dig('data', 'list')
    end

    # # Get extended trip details for a specific transit vehicle.
    # #
    # # Params
    # # - id : the id of the vehicle
    # # - include_trip [optional] : set whether the trip data is included
    # # - include_schedule [optional] : set whether the schedule data is included
    # # - include_status [optional] : set whether the status data is included
    # # - time [optional] : a specific time in the past to get data about
    # def trip_for_vehicle(id,
    #                      include_trip: false,
    #                      include_schedule: false,
    #                      include_status: true,
    #                      time: nil)
    #   options = {}
    #   options['includeTrip'] = include_trip
    #   options['includeSchedule'] = include_schedule
    #   options['includeStatus'] = include_status
    #   options['time'] = get_timestamp time if time

    #   response = request "trip-for-vehicle/#{id}", options
    #   TripDetails.new response.dig('data', 'entry')
    # end

    # # Search for active vehicles for a particular agency by id.
    # #
    # # Params
    # # - id : the id of the agency
    # # - time [optional] : a specific time in the past to get data about
    # def vehicles_for_agency(id,
    #                         time: nil)
    #   options = {}
    #   options['time'] = get_timestamp time if time

    #   response = request "vehicles-for-agency/#{id}", options
    #   VehicleStatus.collect response.dig('data', 'list')
    # end

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
