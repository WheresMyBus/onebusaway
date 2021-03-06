Gem::Specification.new do |s|
  s.name        = 'onebusaway'
  s.summary     = 'OneBusAway API Wrapper'
  s.homepage    = 'http://github.com/WheresMyBus/onebusaway'

  s.email       = 'dhoutsma@uw.edu'
  s.authors     = ['Daniel Houtsma']

  s.version     = '1.0.4'

  s.license     = 'MIT'

  s.files       = `git ls-files lib`.split "\n"

  s.add_runtime_dependency 'httparty', '~> 0.14.0'
  s.add_runtime_dependency 'activesupport', '~> 5.0.0'
end
