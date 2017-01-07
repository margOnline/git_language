class Parser
  def self.parse(response)
    new(response).parse
  end

  def initialize(response)
    @response = response
    @data = JSON.parse(response.body)
  end

  def parse
    response.success? ? parse_response : format_error
  end

  private
  attr_reader :response, :data

  def parse_response
    message = (data.count == 0) ? "No public repos" : parse_repos
    { status: 200, message: message }
  end

  def format_error
    {status: response.status, message: data["message"]}
  end

  def parse_repos
    data
      .map {|repo| repo['language'] }
      .group_by{|lang| lang}
      .reject{|k,v| k.nil?}
      .max_by{|lang| lang.last.length}[0]
  end

end