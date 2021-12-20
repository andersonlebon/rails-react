# frozen_string_literal: true

module V1
  class GreetingsController < ApplicationController # rubocop:todo Style/Documentation
    def index
      @messages = Message.find(rand(1..Message.all.size))
      render json: @messages
    end
  end
end
