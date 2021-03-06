require 'spec_helper'

describe "apartments/index" do
  before(:each) do
    assign(:apartments, [
      stub_model(Apartment,
        :url => "Url",
        :description => "Description",
        :price => 1,
        :longitude => 1.5,
        :latitude => 1.5
      ),
      stub_model(Apartment,
        :url => "Url",
        :description => "Description",
        :price => 1,
        :longitude => 1.5,
        :latitude => 1.5
      )
    ])
  end

  it "renders a list of apartments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
