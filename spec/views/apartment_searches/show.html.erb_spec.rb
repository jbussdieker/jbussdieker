require 'spec_helper'

describe "apartment_searches/show" do
  before(:each) do
    @apartment_search = assign(:apartment_search, stub_model(ApartmentSearch,
      :user_id => 1,
      :min_price => 2,
      :max_price => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
