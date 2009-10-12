require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/index.html.erb" do
  include RoomsHelper

  before(:each) do
    assigns[:rooms] = [
      stub_model(Room,
        :name => "value for name"
      ),
      stub_model(Room,
        :name => "value for name"
      )
    ]
    assigns[:folk] = stub_model(Folk, :id => 1)
    assigns[:new_room] = Room.new
  end
  
  it "renders a create room form" do
    render
    response.should have_tag("form")
  end
  
end
