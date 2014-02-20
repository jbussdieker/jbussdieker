task :scrape => [:environment] do
  Apartment.scrape
end
