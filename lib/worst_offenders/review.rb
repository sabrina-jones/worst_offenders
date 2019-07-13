class WorstOffenders::Review

  def self.today
    #return instances of top offender reviews
    puts <<-DOC
     1. first review
     2. second review
    DOC

   review_1 = self.new
   review_1.heading  = "Best car shop"
   review_1.name = "Sue Brown"

   review_2 = self.new
   review_2.heading = "No other like it!"
   review_2.name = "Bill Jones"

   [review_1, review_2]
  end

end
