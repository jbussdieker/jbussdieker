require 'spec_helper'

describe "ApartmentSearches" do
  describe "GET /apartment_searches" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get apartment_searches_path
      response.status.should be(200)
    end
  end
end
