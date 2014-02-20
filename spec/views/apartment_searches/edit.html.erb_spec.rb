require 'spec_helper'

describe "apartment_searches/edit" do
  before(:each) do
    @apartment_search = assign(:apartment_search, stub_model(ApartmentSearch,
      :user_id => 1,
      :min_price => 1,
      :max_price => 1
    ))
  end

  it "renders the edit apartment_search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apartment_search_path(@apartment_search), "post" do
      assert_select "input#apartment_search_user_id[name=?]", "apartment_search[user_id]"
      assert_select "input#apartment_search_min_price[name=?]", "apartment_search[min_price]"
      assert_select "input#apartment_search_max_price[name=?]", "apartment_search[max_price]"
    end
  end
end
