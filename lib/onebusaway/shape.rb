require_relative 'base'

module OneBusAway
  class Shape < Base
    attr_reader :length, :points

    def initialize(attributes)
      @length = attributes['length'].to_i
      @points = attributes['points']
    end
  end
end
