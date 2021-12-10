class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all
    random_number = rand(0...@messages.length)
    @message = @messages[random_number]
    render json: @messages[random_number]
  end

  def show
    @message = Message.find(params[:id])
    render json: @message
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private
  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end
end

# require 'test_helper'
# 
# class MessagesController::Api::V1Test < ActionDispatch::IntegrationTest
#   setup do
#     @message = messages(:one)
#   end
# 
#   test "should get index" do
#     get api_v1_messages_url
#     assert_response :success
#   end
# 
#   test "should get new" do
#     get new_api_v1_message_url
#     assert_response :success
#   end
# 
#   test "should create message" do
#     assert_difference('Message.count') do
#       post api_v1_messages_url, params: { message: { content: @message.content, user_id: @message.user_id, room_id: @message.room_id } }
#     end
# 
#     assert_redirected_to message_url(Message.last)
#   end
# 
#   test "should show message" do
#     get api_v1_message_url(@message)
#     assert_response :success
#   end
# 
#   test "should get edit" do
#     get edit_api_v1_message_url(@message)
#     assert_response :success
#   end
# 
#   test "should update message" do
#     patch api_v1_message_url(@message), params: { message: { content: @message.content, user_id: @message.user_id, room_id: @message.room_id } }
#     assert_redirected_to message_url(@message)
#   end
# 
#   test "should destroy message" do
#     assert_difference('Message.count', -1) do