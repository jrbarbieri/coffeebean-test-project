class IpDataService
  include HTTParty
  AUTHENTICATION_TOKEN = '4962cdca89d2c5'
  base_uri 'ipinfo.io'

  def self.call(ip_address)
    new(ip_address).call
  end

  def initialize(ip_address)
    @ip_address = ip_address
    @options = { query: { token: AUTHENTICATION_TOKEN } }
  end

  def call
    response = self.class.get("/#{@ip_address}", @options)
    parse_response(response)
  end

  private

  def parse_response(response)
    JSON.parse(response.body)
  rescue JSON::ParserError
    { error: 'Unable to parse response as JSON' }
  end
end
