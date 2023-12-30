class Api::V1::MessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, except: [:random_text]

  # GET /messages
  def index
    @messages = Message.where(user_id: params[:user_id], conversation_id: params[:conversation_id])

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @user = User.find(params[:user_id])
    @conversation = @user.conversations.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy!
  end

  def random_text
    render json: { text: Faker::Lorem.characters(number: 200) }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:user_id, :message, :reply)
  end
end
