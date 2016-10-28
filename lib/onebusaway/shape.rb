require_relative 'base'

module OneBusAway
  class Shape < Base
    attr_reader :length,
                :points

    def initialize(attributes)
      @length = attributes['length']
      @points = attributes['points']
    end
  end
end
