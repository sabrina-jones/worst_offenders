RSpec.describe WorstOffenders do
  it "has a version number" do
    expect(WorstOffenders::VERSION).not_to be nil
  end

describe "Review" do

  describe "#scrape" do

  it "has a Nokogiri url for scrapping the page that returns a HTML doc" do
    url = "http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/?filter=ALL_REVIEWS#link/"
    doc_url = Nokogiri::HTML(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))
    expect(doc_url).not_to be nil
  end


  it "is a class method that scrapes the first 5 pages of dealer reviews and returns an array of 3 unordered" do
    scraped_reviews = WorstOffenders::Review.scrape
    expect(scraped_reviews).to be_a(Array)
    expect(scraped_reviews).to_not be_empty
   end
  end

  describe "#top_offenders" do
  it "is a class method that returns the top 3 offenders sorted by username" do
    scraped_reviews = WorstOffenders::Review.top_offenders
    expect(scraped_reviews).to be_a(Array)
    expect(scraped_reviews).to_not be_empty
   end

   it 'has three top overly positive reviews' do
    expect(WorstOffenders::Review.top_offenders.size).to eq(3)
  end

  end

 end

end
