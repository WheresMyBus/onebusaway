module OneBusAway
  class Agency
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
      @disclaimer = attributes['disclaimer']
      @email = attributes['email']
      @fare_url = attributes['fareUrl']
      @id = attributes['id']
      @lang = attributes['lang']
      @name = attributes['name']
      @phone = attributes['phone']
      @private_service = attributes['privateService']
      @timezone = attributes['timezone']
      @url = attributes['url']
    end

    def self.collect(array)
      array.map { |attributes| new attributes }
    end
  end
end
