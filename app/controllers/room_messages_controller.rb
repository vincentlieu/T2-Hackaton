class RoomMessagesController < ApplicationController
before_action :load_entities

    def create
      puts params[:description]
        @room_message = current_user.create(messages_params)        
    end
    
# he has this code too
  #   RoomChannel.broadcast_to @room, @room_message
  # end
  #^ after we get ActionCable and wewbsockets
  #ok cool!
  
      protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

  private
  def messages_params
    params.require(:rooms_messages).permit(:description)
  end
end 
