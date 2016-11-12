module OneBusAway
  module Collector

    # A helper method for mapping an array of attributes to an array of
    # objects. Returns an array of objects or an empty array if array is
    # nil.
    #
    # Params
    # - array : an array of hashes
    def collect(array)
      array.try(:map) { |attributes| new attributes } || []
    end
  end
end
