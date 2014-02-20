require 'spec_helper'

describe "apartment_searches/new" do
  before(:each) do
    assign(:apartment_search, stub_model(ApartmentSearch,
      :user_id => 1,
      :min_price => 1,
      :max_price => 1
    ).as_new_record)
  end

  it "renders new apartment_search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apartment_searches_path, "post" do
      assert_select "input#apartment_search_user_id[name=?]", "apartment_search[user_id]"
      assert_select "input#apartment_search_min_price[name=?]", "apartment_search[min_price]"
      assert_select "input#apartment_search_max_price[name=?]", "apartment_search[max_price]"
    end
  end
end
