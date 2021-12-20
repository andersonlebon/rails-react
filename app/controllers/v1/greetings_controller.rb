class V1::GreetingsController < ApplicationController
  def index
    @messages = Message.find(rand(1..Message.all.size))
    render json: @messages
  end
end
