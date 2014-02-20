class Apartment < ActiveRecord::Base
  has_many :apartment_tags

  def tags
    self.apartment_tags.collect(&:value).join(", ")
  end

  def self.scrape
    require 'clscrape'

    cl = CLscrape::Client.new("sfbay")
      #["s", 100],
    listings = cl.get_search("eby", "apa", [
      ["nh", 48],
      ["nh", 58],
      ["nh", 61],
      ["nh", 62],
      ["nh", 64],
      ["nh", 11],
      ["minAsk", 1000],
      ["maxAsk", 2200],
      ["bedrooms", 2],
    ])

    listings.each do |listing|
      apartment = Apartment.find_by(:url => listing.url)
      options = {
        :url => listing.url,
        :title => listing.title,
        :longitude => listing.longitude,
        :latitude => listing.latitude,
        :price => listing.price,
        :posted_at => listing.details.posted_at
      }
      if apartment
        apartment.update_attributes(options)
      else
        apartment = Apartment.create(options)
      end

      tags = listing.details.tags.map {|a| {:value => a}}
      apartment.tags.create(tags)
    end
  end
end
