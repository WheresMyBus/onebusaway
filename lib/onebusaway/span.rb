require_relative 'base'

module OneBusAway
  class Span < Base
    attr_reader :lat_span,
                :lon_span

    def initialize(attributes)
      @lat_span = attributes.try :[], 'latSpan'
      @lon_span = attributes.try :[], 'lonSpan'
    end

    def to_hash
      {
        'latSpan' => lat_span,
        'lonSpan' => lon_span
      }
    end
  end
end
