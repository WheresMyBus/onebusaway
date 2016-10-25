require 'httparty'
Dir[__dir__ + '/onebusaway/*.rb'].each do |file|
  require file
end

module OneBusAway
  class << self
    BASE_URL = 'http://api.onebusaway.org/api/where/'.freeze

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

    private

    def request(call, options = {})
      options[:key] = @api_key || 'TEST'
      response = HTTParty.get "#{BASE_URL}#{call}.json", query: options
      JSON.parse response.body
    end

    def references(response, type = nil)
      references = response['data']['references']
      references.fetch type, references
    end

    def referenced_agencies(response)
      Agency.collect references(response, 'agencies')
    end
  end
end
