# adapter for http://www.smsapi.pl https API
class Smsapi
  include HTTParty
  base_uri 'https://ssl.smsapi.pl'

  def initialize(notification)
    @notification = notification
  end

  def deliver
    handle_response self.class.post("/sms.do", options)
  end

  def options
    {
      http_proxyaddr: Setting['plugin_notifications']['proxy_host'],
      http_proxyport: Setting['plugin_notifications']['proxy_port'],
      ssl_ca_file: Setting['plugin_notifications']['ssl_ca_file'],
      query: {
        username: Setting['plugin_notifications']['smsapi_username'],
        password: Setting['plugin_notifications']['smsapi_password'],
        message: @notification.content, # zawartosc
        to: @notification.to, # odbiorca
        normalize: 1,
        eco: 1, # eco oznacza tansze smsy. ale nie mamy wlasdzy na numerem nadawcy
        test: Setting['plugin_notifications']['test'] == "1" ? 1 : 0 # nie wysyla wiadomosci
      }}
  end

  def handle_response(response)
    status, code, _ = response.body.split(':')
    status == "OK" ?  success( code ) : error( code )
  end

  def success(gid)
    @notification.gid = gid
    @notification.save
  end

  def error(code)
    raise "smsapi ERR code #{code} : notification #{@notification.id}"
  end

end
