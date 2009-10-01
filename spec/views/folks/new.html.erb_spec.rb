require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/folks/new.html.erb" do
  include FolksHelper

  before(:each) do
    assigns[:folk] = stub_model(Folk,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new folk form" do
    render

    response.should have_tag("form[action=?][method=post]", folks_path) do
      with_tag("input#folk_name[name=?]", "folk[name]")
    end
  end
end
