  module ProximoParty
    include HTTParty

    PROXIMO = URI.parse(ENV["PROXIMO_URL"])

    http_proxy PROXIMO.host, 80, PROXIMO.user, PROXIMO.password

    def get url
      self.class.get url
    end
  end
