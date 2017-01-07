require 'httpclient'

class ApiRequest
  attr_reader :username, :http_client

  def initialize(username)
    @username = username
    @http_client = HTTPClient.new
  end

  def call
    http_response = http_client.get(request_uri)
    ApiResponse.from_http_response(http_response)
  end

  private

  def request_uri
    "https://api.github.com/users/#{username}/repos"
  end

end
