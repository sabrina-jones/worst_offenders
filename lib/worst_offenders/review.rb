class WorstOffenders::Review
  attr_accessor :heading, :user, :content

 def self.top_offenders
    #sorted by username
    sort_top3 = self.scrape
    sort_top3.sort_by! { |sort_top3| sort_top3.user }

 end


  def self.scrape

    offender_reviews = Array.new
    page = 1
    last_page = 5

   while page <= last_page
      pagination_url = "http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}/?filter=ALL_REVIEWS#link/"
      pagination_doc = Nokogiri::HTML(open(pagination_url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))

      pagination_reviews = pagination_doc.css("div.review-entry")

      pagination_reviews.each do |review|

          offender_review = {

            heading: review.css("h3.no-format").text.delete('\"'),
            user:    review.css("span.italic").text.delete('- '),
            content: review.css("p.font-16.review-content").text
          }

          if offender_review[:heading].include? ("Best car buying experience")
              if offender_reviews.length <=2
                 offender_reviews << offender_review
              end
          end
        end
        page += 1
     end

      review_1 = self.new
      review_1.heading  = offender_reviews[0][:heading]
      review_1.user = offender_reviews[0][:user]
      review_1.content = offender_reviews[0][:content]

      review_2 = self.new
      review_2.heading  = offender_reviews[1][:heading]
      review_2.user = offender_reviews[1][:user]
      review_2.content = offender_reviews[1][:content]

      review_3 = self.new
      review_3.heading  = offender_reviews[2][:heading]
      review_3.user = offender_reviews[2][:user]
      review_3.content = offender_reviews[2][:content]

      [review_1, review_2, review_3]
  end
end
