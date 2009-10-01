require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/rooms/show.html.erb" do
  include RoomsHelper
  before(:each) do
    assigns[:room] = @room = stub_model(Room,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
