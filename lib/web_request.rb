module WebRequest
  include HTTParty

  URI = URI.parse(ENV['FIXIE_URL'])

  http_proxy URI.host, 80, URI.user, URI.password

  def get(url, args)
    self.class.get(url, args)
  end
end
