require_relative 'base'

module OneBusAway
  class Agency < Base
    extend Collector

    attr_reader :disclaimer,
                :email,
                :fare_url,
                :id,
                :lang,
                :name,
                :phone,
                :private_service,
                :timezone,
                :url

    def initialize(attributes)
      @disclaimer      = attributes.try :[], 'disclaimer'
      @email           = attributes.try :[], 'email'
      @fare_url        = attributes.try :[], 'fareUrl'
      @id              = attributes.try :[], 'id'
      @lang            = attributes.try :[], 'lang'
      @name            = attributes.try :[], 'name'
      @phone           = attributes.try :[], 'phone'
      @private_service = attributes.try :[], 'privateService'
      @timezone        = attributes.try :[], 'timezone'
      @url             = attributes.try :[], 'url'
    end
  end
end
