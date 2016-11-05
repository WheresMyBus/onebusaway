require_relative 'base'

module OneBusAway
  class Shape < Base
    attr_reader :length,
                :points

    def initialize(attributes)
      @length = attributes.try :[], 'length'
      @points = attributes.try :[], 'points'
    end
  end
end
