module RoomsHelper
  def room_name
    if action_name == "index"
      "Lobby"
    else
      @room.name
    end
  end
end
