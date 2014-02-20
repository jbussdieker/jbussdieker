require 'spec_helper'

describe "apartments/new" do
  before(:each) do
    assign(:apartment, stub_model(Apartment,
      :url => "MyString",
      :description => "MyString",
      :price => 1,
      :longitude => 1.5,
      :latitude => 1.5
    ).as_new_record)
  end

  it "renders new apartment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apartments_path, "post" do
      assert_select "input#apartment_url[name=?]", "apartment[url]"
      assert_select "input#apartment_description[name=?]", "apartment[description]"
      assert_select "input#apartment_price[name=?]", "apartment[price]"
      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"
      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"
    end
  end
end
