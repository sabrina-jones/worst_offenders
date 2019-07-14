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

    doc = Nokogiri::HTML(open("https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-review-23685/"))

    offender_reviews = Array.new
    reviews = doc.css("div.review-entry") #data for all reviews on the page

    page = 1
    last_page = 5

   while page <= last_page
      pagination_url = "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-review-23685/page#{page}/"
      pagination_doc = Nokogiri::HTML(open(pagination_url))
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
