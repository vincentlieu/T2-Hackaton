class RoomsController < ApplicationController
    def index
        @rooms = Room.all
    end

    def show
       
    end

    def new
        @room = Room.new
    end
    
    def create
        @room = Room.create(params.require(:room).permit(:title))
    end

    def edit
        
    end

    def update
        @room = Room.update(params["id"], params.require(:room).permit(:title)
    end

    def destroy
        Room.find(params[:id]).destroy
    end

    private

    def set_room
        id = params[:id]
        @room = Room.find(id)
    end

end
