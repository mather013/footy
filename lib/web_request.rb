module WebRequest
  include HTTParty

  URI = URI.parse(ENV['FIXIE_URL'])

  http_proxy URI.host, 80, URI.user, URI.password

  def get(url, args)
    log_request(url) if TOGGLES_CONFIG['log_web_requests']
    self.class.get(url, args)
  end

  private

  def log_request(url)
    File.open("tmp/web_requests_#{date_to_s}.txt", 'a+') { |file| file.write("#{time_to_s}: #{url}\n") }
  end

  def date_to_s
    Date.today.strftime('%Y%m%d')
  end

  def time_to_s
    DateTime.now.strftime('%H%M%S')
  end

end
