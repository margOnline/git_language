class ApiResponse
  def self.from_http_response(http_response)
    new(
      status: http_response.http_header.status_code,
      body: http_response.body
    )
    end

  attr_reader :status, :body

  def initialize(status:, body:)
    @status = status
    @body = body
  end

  def success?
    status == 200
  end

  private

end
