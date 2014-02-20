require 'spec_helper'

describe "apartments/edit" do
  before(:each) do
    @apartment = assign(:apartment, stub_model(Apartment,
      :url => "MyString",
      :description => "MyString",
      :price => 1,
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders the edit apartment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", apartment_path(@apartment), "post" do
      assert_select "input#apartment_url[name=?]", "apartment[url]"
      assert_select "input#apartment_description[name=?]", "apartment[description]"
      assert_select "input#apartment_price[name=?]", "apartment[price]"
      assert_select "input#apartment_longitude[name=?]", "apartment[longitude]"
      assert_select "input#apartment_latitude[name=?]", "apartment[latitude]"
    end
  end
end
