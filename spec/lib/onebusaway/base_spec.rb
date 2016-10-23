require_relative '../../spec_helper'

describe OneBusAway::Base do
  describe 'default attributes' do
    it 'must include httparty methods' do
      OneBusAway::Base.must_include HTTParty
    end

    it 'must have the base url set to the OneBusAway API endpoint' do
      OneBusAway::Base.base_uri.must_equal 'http://api.onebusaway.org/api/'
    end
  end
end
