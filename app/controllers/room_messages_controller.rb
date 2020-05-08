class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create
    p "**********"
    p params
    p "**********"

    @room_message = current_user.room_messages.create(messages_params)
    redirect_back(fallback_location: root_path)
  end

  # he has this code too
  #   RoomChannel.broadcast_to @room, @room_message
  # end
  #^ after we get ActionCable and wewbsockets
  #ok cool!

  protected

  def load_entities
    @room = current_user.rooms.find_by_id(params[:id])
  end

  private

  def messages_params
    params.require(:room_message).permit(:user_id, :room_id, :description)
  end
end
