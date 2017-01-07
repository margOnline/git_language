require 'rails_helper'

RSpec.describe ApiResponse, type: :model do

  describe "#from_http_response" do
    let(:header) { double(:http_header, status_code: 200) }
    let(:response) { double(:http_response, http_header: header, body: "text" )}
    
    it "creates an ApiResponse instance" do
      api_response = ApiResponse.from_http_response(response)
      expect(api_response.status).to eq 200
      expect(api_response.body).to eq "text"
    end
  end

  describe "success?" do
    it "returns true if status is 200" do
      api_response = ApiResponse.new(status: 200, body: "text")
      expect(api_response.success?).to be_truthy
    end

    it "returns false if status is not 200" do
      api_response = ApiResponse.new(status: 404, body: "text")
      expect(api_response.success?).to be_falsey
    end
  end

end