require_relative 'base'

module OneBusAway
  class Route < Base
    extend Collector

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
      @agency_id   = attributes.try :[], 'agencyId'
      @color       = attributes.try :[], 'color'
      @description = attributes.try :[], 'description'
      @id          = attributes.try :[], 'id'
      @long_name   = attributes.try :[], 'longName'
      @short_name  = attributes.try :[], 'shortName'
      @text_color  = attributes.try :[], 'textColor'
      @type        = attributes.try :[], 'type'
      @url         = attributes.try :[], 'url'
    end
  end
end
