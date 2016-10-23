require_relative '../lib/onebusaway'

require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/onebusaway_cassettes'
  c.hook_into :webmock
end
