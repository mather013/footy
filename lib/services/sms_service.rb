module Services
  class SmsService

    def perform hash
      blowerio = RestClient::Resource.new(blower_url)
      blowerio['/messages'].post :to => "#{hash['mobile']}", :message => "#{hash['message']}"
    end

    private

    def blower_url
      ENV['BLOWERIO_URL']
    end

  end
end
