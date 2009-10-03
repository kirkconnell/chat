module MessagesHelper
  def looking_for_latest_messages?
    !(params[:folk_id].nil? || params[:room_id].nil?)
  end
  
  def new_folks_joined?
    !new_folks_ids.empty?
  end
  
  def some_folks_left?
    !deserter_folks_ids.empty?
  end
  
  def new_folks_ids
    previous_list = session[:online]
    new_list = @room.online_folks_ids
    new_list.reject { |folk| previous_list.include? folk }
  end
  
  def deserter_folks_ids
    previous_list = session[:online]
    new_list = @room.online_folks_ids
    previous_list.reject{ |folk| new_list.include? folk }
  end
  
end

def post_notification_to(page, message)
  not_id = rand(2**32)
  page.insert_html :bottom, 'message_table', :partial => "/rooms/notification", 
                   :locals => { :message => message,
                                :notification_id => not_id}
  page.visual_effect :highlight, "notification_#{not_id}"
end
