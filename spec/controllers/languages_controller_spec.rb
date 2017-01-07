require 'rails_helper'

RSpec.describe LanguagesController, type: :controller do
 
  describe "show" do
    context "with a valid username" do
      it "returns a hash with a language" do
        get :show, username: 'margonline'
        expect(assigns(:results)).to eq({status: 200, message: "Ruby"})
      end
    end

    context "with an invalid username" do
      it "returns a hash with an error message" do
        get :show, username: 'js'
        expect(assigns(:results)).to eq({status: 400, message: "Invalid username"})
      end
    end
  end

end
