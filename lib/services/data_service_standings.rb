module Services
  class DataServiceStandings < DataService

    def perform
      url = "#{api_url('standings')}"
      hash = send_request url
      raise "Error: #{hash[:ERROR]}" if hash[:ERROR].present?
      hash[:teams]
    end

  end
end
