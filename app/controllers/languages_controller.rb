class LanguagesController < ApplicationController
  
  def index
  end

  def show
    if valid?(params[:username])
      response = ApiRequest.new(params[:username]).call
      @results = Parser.parse(response)
    else
      @results = {status: 400, message: "Invalid username"}
    end   
  end

  private
  def valid?(username)
    regex = Regexp.new(/^[a-z,A-Z][\w-]{2,25}$/)
    regex.match(username)
  end

end