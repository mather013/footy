module Services
  class AnalyticsService

    def self.publish event, params
      params.merge!({ environment: Rails.env })
      Keen.publish(event.to_sym, params) if Rails.env.production?
    end

  end
end
