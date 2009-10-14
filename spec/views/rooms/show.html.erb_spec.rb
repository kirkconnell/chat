require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/show.html.erb" do
  include RoomsHelper
  before(:each) do
    assigns[:room] = @room = stub_model(Room,
      :name => "Room Name"
    )
    assigns[:folk] = @folk = stub_model(Folk,
      :name => "Carlos"
    )
    assigns[:message] = Message.new
  end

  it "renders the room's name" do
    render
    response.should have_text(/Room\ Name/)
  end
  
  it "renders the current folk's name" do
    render
    response.should have_text(/Carlos/)
  end
  
  it "renders a return to lobbie link" do
    render
    response.should have_text(/Return\ to\ Lobby/)
  end
  
end
