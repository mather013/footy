module Services
  class SmsService

    def perform(hash)
      require 'clockwork'
      api = Clockwork::API.new(clockwork_api_key)
      message = api.messages.build(:to => clean_number(hash['mobile']), :content => hash['message'])
      response = message.deliver
      response.success
    end

    private

    def clockwork_api_key
      ENV['CLOCKWORK_KEY']
    end

    def clean_number(mobile)
      mobile.gsub('+', '')
    end

  end
end
