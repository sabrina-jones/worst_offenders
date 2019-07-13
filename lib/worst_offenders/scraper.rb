class WorstOffenders::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/"))
  end

end
