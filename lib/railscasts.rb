require 'net/http'

module Railscasts
  class Screencast
    attr_accessor :id, :position, :name, :description, :url, :permalink, :pro, :revised

    def initialize(data)
      data.each { |name, value| instance_variable_set("@#{name}", value) }
    end

    def slug
      "#{position}-#{permalink}"
    end

    def link
      "http://railscasts.com/episodes/#{slug}"
    end
  end

  def self.all
    uri = URI.parse("http://railscasts.com/episodes.json")
    resp = Net::HTTP.get_response(uri)
    JSON.parse(resp.body).collect do |item|
      Screencast.new(item)
    end
  end
end
