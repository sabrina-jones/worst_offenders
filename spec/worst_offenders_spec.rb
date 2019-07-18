RSpec.describe WorstOffenders do
  it "has a version number" do
    expect(WorstOffenders::VERSION).not_to be nil
  end

describe "Review" do

  it "can be called on with no errors" do
   expect {WorstOffenders::Review}.to_not raise_error
 end

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

  it "stored reviews must include the phrase 'Best car buying experience'" do
    WorstOffenders::Review.scrape.each.with_index(1) do |review, index|
    expect(review.heading).to include("Best car buying experience")
  end
 end

  it "scrapes a heading, a user, and content of a review" do
    WorstOffenders::Review.scrape.each.with_index(1) do |review, index|
    expect(review.heading).not_to be nil
    expect(review.user).not_to be nil
    expect(review.content).not_to be nil
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
