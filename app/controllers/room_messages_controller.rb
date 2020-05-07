class RoomMessagesController < ApplicationController

    def create
        @room_message = RoomMessage.create user: current_user, room: @room, description: params.dig(:room_message, :message)
        
    end

      protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

end 