module MessagesHelper
  def looking_for_latest_messages?
    !(params[:folk_id].nil? || params[:room_id].nil?)
  end
end
