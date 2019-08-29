require 'open-uri'

class WorstOffenders::Scrape

def self.get_reviews (url, pages, criteria, client =Nokogiri::HTML)

  page = client.parse(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
  #warn page.inspect

  pagination_reviews = page.css("div.review-entry")

  reviews = pagination_reviews.map do |review|

      #each review has a heading, user and content for our purposes
     {
        heading: review.css("h3.no-format").text.delete('\"'),
        user:    review.css("span.italic").text.delete('- '),
        content: review.css("p.font-16.review-content").text
      }

   end
    warn reviews.inspect
end


end
