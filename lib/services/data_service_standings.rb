module Services
  class DataServiceStandings < DataService

    def perform
      url = "#{api_url('standings')}"
      hash = send_request url
      hash[:teams]
    end

  end
end
