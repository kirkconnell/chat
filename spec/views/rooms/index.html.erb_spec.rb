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
  end

  it "renders a list of rooms" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
