class WorstOffenders::Review
  attr_accessor :heading, :name

  def self.today
    #return instances of top offender reviews

   review_1 = self.new
   review_1.heading  = "Best car shop"
   review_1.name = "Sue Brown"

   review_2 = self.new
   review_2.heading = "No other like it!"
   review_2.name = "Bill Jones"

   [review_1, review_2]
  end

  def self.scrape

  #  doc = Nokogiri::HTML(open("http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/?filter=ALL_REVIEWS#link", ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))

    offender_reviews = Array.new
    #reviews = doc.css("div.review-entry") #data for all reviews on the page

    page = 1
    last_page = 5

   while page <= last_page
      pagination_url = "http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}/?filter=ALL_REVIEWS#link/"
      pagination_doc = Nokogiri::HTML(open(pagination_url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))

      pagination_reviews = pagination_doc.css("div.review-entry")

      puts pagination_url

      pagination_reviews.each do |review|

          offender_review = {

            heading: review.css("h3.no-format").text.delete('\"'),
            user:    review.css("span.italic").text.delete('- '),
            content: review.css("p.font-16.review-content").text
          }

          offender_reviews << offender_review
          puts "Added #{offender_review[:heading]}"
        end
        page += 1
     end
      binding.pry
  end

end
