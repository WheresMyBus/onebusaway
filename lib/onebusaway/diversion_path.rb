require_relative 'base'

module OneBusAway
  class DiversionPath < Base
    attr_reader :points

    def initializer(attributes)
      @points = attributes.try :[], 'points'
    end
  end
end
