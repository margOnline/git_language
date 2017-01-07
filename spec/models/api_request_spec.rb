require 'rails_helper'

RSpec.describe ApiRequest, type: :model do

  describe "#call" do
    let(:username) { "username" }
    let(:uri) { "https://api.github.com/users/#{username}/repos" }
    let(:http_response) { double(:http_response)}
    subject { ApiRequest.new(username) }

    it "sends the request with the username and creates a response" do
      expect(subject.http_client).to receive(:get).with(uri).and_return(http_response)
      expect(ApiResponse).to receive(:from_http_response).with(http_response)
      subject.call
    end
  end

end