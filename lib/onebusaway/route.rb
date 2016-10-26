require_relative 'base'

module OneBusAway
  class Route < Base
    attr_reader :agency_id,
                :color,
                :description,
                :id,
                :long_name,
                :short_name,
                :text_color,
                :type,
                :url

    def initialize(attributes)
      @agency_id = attributes['agencyId']
      @color = attributes['color']
      @description = attributes['description']
      @id = attributes['id']
      @long_name = attributes['longName']
      @short_name = attributes['shortName']
      @text_color = attributes['textColor']
      @type = attributes['type']
      @url = attributes['url']
    end

    def self.collect(array)
      array.map { |attributes| new attributes }
    end
  end
end
