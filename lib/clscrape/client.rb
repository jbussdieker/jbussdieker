require 'net/http'
require 'nokogiri'

module CLscrape
  class Client
    attr_accessor :region

    def initialize(region)
      @region = region
    end

    def host
      "#{region}.craigslist.org"
    end

    def get_request(url)
      client = Net::HTTP.new(host)
      req = Net::HTTP::Get.new(url)
      client.request(req)
    end

    def request_nhs(location)
      get_request("/#{location}/apa/")
    end

    def request_listings(location, type)
      get_request("/#{location}/#{type}/")
    end

    def request_search(location, type, options)
      params = options.collect {|k,v| "#{k}=#{v}"}.join("&")
      get_request("/search/#{location}/#{type}?#{params}") # nh=#{nh}&minAsk=1&maxAsk=2")
    end

    def get_nhs(location)
      list = {}
      doc = resp_doc(request_nhs(location))
      doc.xpath('//select[@id="nh"]/option').collect do |node|
        id = node.attributes["value"]
        name = node.text
        list[id] = name
      end
      list
    end

    def get_listings(location, type)
      doc = resp_doc(request_listings(location, type))
      doc.xpath('//p[@class="row"]').collect do |node|
        Apartment.new(self, node)
      end
    end

    def get_search(location, type, query)
      doc = resp_doc(request_search(location, type, query))
      doc.xpath('//p[@class="row"]').collect do |node|
        Apartment.new(self, node)
      end
    end

    def get_url(url)
      resp_doc(get_request(url))
    end

    def resp_doc(resp)
      Nokogiri::HTML(resp.body)
    end
  end
end
