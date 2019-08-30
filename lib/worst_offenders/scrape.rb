require 'open-uri'

class WorstOffenders::Scrape

#def self.get_reviews  #(url, pages, criteria, client =Nokogiri::HTML)

#  url = "http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}" #/?filter=ALL_REVIEWS#link/
  #page = client.parse(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  #warn page.inspect

  #pagination_reviews = page.css("div.review-entry")

  #reviews = pagination_reviews.map do |review|

      #each review has a heading, user and content for our purposes
     #{
      #  heading: review.css("h3.no-format").text.delete('\"'),
      # user:    review.css("span.italic").text.delete('- '),
      #  content: review.css("p.font-16.review-content").text
    #  }

#   end
  #  warn reviews.inspect
#end



def self.scrape

  offender_reviews = Array.new
  page = 1
  last_page = 5

 while page <= last_page
   #to scrape the first 5 pages
    pagination_url = "http://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page#{page}" #/?filter=ALL_REVIEWS#link/
    pagination_doc = Nokogiri::HTML(open(pagination_url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE, 'User-Agent' => 'chrome'))

    pagination_reviews = pagination_doc.css("div.review-entry")

    pagination_reviews.each do |review|

        #each review has a heading, user and content for our purposes
        offender_review = {
          heading: review.css("h3.no-format").text.delete('\"'),
          user:    review.css("span.italic").text.delete('- '),
          content: review.css("p.font-16.review-content").text
        }

        #only store in array if meets the "best buying experience criteria"
        #if offender_review[:heading].include?("Best car buying experience") || offender_review[:heading].include?("Best experience")
            #if offender_reviews.length <=2
          offender_reviews << offender_review
          #  end
      #  end
      end
      page += 1
    end
  # binding.pry
  end
end
