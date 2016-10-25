require 'httparty'
Dir[__dir__ + '/onebusaway/*.rb'].each do |file|
  require file
end

module OneBusAway
  class << self
    BASE_URL = 'http://api.onebusaway.org/api/where/'.freeze

    attr_writer :api_key

    def agency(id)
      response = request("agency/#{id}")
      Agency.new(response['data']['entry'])
    end

    private

    def request(call, options = {})
      raise 'API key not set!' unless @api_key

      options[:key] = @api_key

      response = HTTParty.get("#{BASE_URL}#{call}.json", query: options)
      JSON.parse(response.body)
    end
  end
end
