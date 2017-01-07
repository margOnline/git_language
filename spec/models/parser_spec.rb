require 'rails_helper'

RSpec.describe Parser, type: :model do

  let(:response) { double(:response, success?: success, status: status, body: body) }
  subject { described_class.parse(response) }

  describe ".parse" do
    context "with a successful response" do
      let(:success) { true }
      let(:status) { 200 }
      let(:body) {"[{\"language\":\"Ruby\", \"language\":\"CSS\", \"language\":\"Ruby\"}]"}

      it "returns a hash with the status and the most prevalent language" do
        expect(subject).to eq({ status: 200, message: "Ruby"})
      end
    end

    context "with a successful response that has no repos" do
      let(:success) { true }
      let(:status) { 200 }
      let(:body) {"[]"}

      it "returns a hash with the status and an informative message" do
        expect(subject).to eq({ status: 200, message: "No public repos"})
      end
    end

    context "with an unsuccesful response" do
      let(:success) { false }
      let(:status) { 404 }
      let(:body) {"{\"message\":\"Not Found\"}"}    

      it "returns a hash with the status and an error message" do
        expect(subject).to eq({ status: 404, message: "Not Found"})
      end
    end

  end

end