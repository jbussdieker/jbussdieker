module CLscrape
  class Detail
    attr_accessor :client, :listing

    def initialize(client, listing)
      @client = client
      @listing = listing
    end

    def posted
      elem = doc.xpath(".//time").first
      elem.attributes["datetime"] if elem
    end

    def address
      elem = doc.xpath(".//div[@class='mapaddress']").first
      elem.text if elem
    end

    def laundry
      elem = doc.xpath(".//p[@class='attrgroup']").first
      if elem
        list = elem.xpath(".//span")
        list.each do |a|
          if a.text =~ /laundry|w\/d/i
            return a.text
          end
        end
      end
      nil
    end

    def parking
      elem = doc.xpath(".//p[@class='attrgroup']").first
      if elem
        list = elem.xpath(".//span")
        list.each do |a|
          if a.text =~ /parking|garage|carport/i
            return a.text
          end
        end
      end
      nil
    end

    def body
      @body ||= client.get_request(listing.url).body
    end

    private

    def doc
      @doc ||= client.get_url(listing.url)
    end
  end
end
