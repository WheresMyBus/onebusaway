require 'simplecov'
SimpleCov.start
require_relative '../lib/onebusaway'

require 'minitest/autorun'
require 'webmock/minitest'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/onebusaway_cassettes'
  c.hook_into :webmock
end
