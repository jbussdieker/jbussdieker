class Apartment < ActiveRecord::Base
  has_many :apartment_tags
  has_many :apartment_logs

  def tags
    self.apartment_tags.collect(&:value).join(", ")
  end

  def self.listing_attributes(listing)
    {
      :url => listing.url,
      :title => listing.title,
      :longitude => listing.longitude,
      :latitude => listing.latitude,
      :price => listing.price,
      :posted_at => listing.details.posted_at,
      :neighborhood => listing.nh
    }
  end

  def self.scrape
    require 'clscrape'

    cl = CLscrape::Client.new("sfbay")
    listings = cl.get_listings("eby", "apa")

    listings.each do |listing|
      apartment = Apartment.find_by(:url => listing.url)

      if apartment
        apartment.update_attributes(listing_attributes(listing))
      else
        apartment = Apartment.create(listing_attributes(listing))
      end

      tags = listing.details.tags.map {|tag| {:value => tag}}

      apartment.apartment_tags.create(tags)
    end
  end
end
