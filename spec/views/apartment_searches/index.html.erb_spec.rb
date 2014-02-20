require 'spec_helper'

describe "apartment_searches/index" do
  before(:each) do
    assign(:apartment_searches, [
      stub_model(ApartmentSearch,
        :user_id => 1,
        :min_price => 2,
        :max_price => 3
      ),
      stub_model(ApartmentSearch,
        :user_id => 1,
        :min_price => 2,
        :max_price => 3
      )
    ])
  end

  it "renders a list of apartment_searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
