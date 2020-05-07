class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.create(rooms_params)
     if @room.errors.any?
      render "new"
    else
      redirect_to root_path
    end
  end

  def edit
    @room = current_user.rooms.find_by_id(params[:id])

    if @room
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
  @room = current_user.rooms.find_by_id(params[:id])

    if @room
      @room.update(rooms_params)
      if @room.errors.any?
        render "edit"
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    Room.find(params[:id]).destroy
  end

end
  private

  def set_room
    id = params[:id]
    @room = Room.find(id)
  end

  def rooms_params()
    params.require(:room).permit(:title)
  end
