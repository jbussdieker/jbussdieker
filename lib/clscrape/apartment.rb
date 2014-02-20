require 'geocoder'

#Geocoder.configure(:lookup => :nominatim)
Geocoder.configure(:lookup => :geocoder_ca)

module CLscrape
  class Apartment
    attr_accessor :client, :doc

    def initialize(client, doc)
      @client = client
      @doc = doc
    end

    def url
      "http://#{client.host}#{path}"
    end

    def details
      Detail.new(client, self)
    end

    def to_s
      title
    end

    def title
      elem = doc.xpath(".//span[@class='pl']/a").first
      elem.text if elem
    end

    def path
      elem = doc.xpath(".//a/@href").first
      elem.value if elem
    end

    def bedrooms
      elem = doc.xpath(".//span[@class='l2']").first
      if elem
        matches = elem.text.match(/(\d+)br/)
        if matches
          matches.captures.first
        end
      end
    end

    def longitude
      elem = doc.xpath("./@data-longitude").first
      elem.value if elem
    end

    def latitude
      elem = doc.xpath("./@data-latitude").first
      elem.value if elem
    end
    
    def price
      elem = doc.xpath('.//span[@class="price"]').first
      elem.text.gsub("$", "") if elem
    end

    def id
      elem = doc.xpath("./@data-pid").first
      elem.value.to_i if elem
    end

    def geo
      Geocoder.search([latitude, longitude]).first
    end

    def distance(dest)
      Geocoder::Calculations.distance_between([latitude, longitude], dest)
    end
  end
end
