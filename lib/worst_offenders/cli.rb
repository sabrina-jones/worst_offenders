class WorstOffenders::CLI

  def call
    puts "Worst offenders for overly positive reviews"
    start
    #list_reviews
  end

  def start
    input = nil
    while input != "exit"
      puts "Would you liket to view the Top 3 offenders or the criteria (y/n/ exit to quit) ?"
      input = gets.strip.downcase
      case input
      when "y"
        list_reviews
      when "n"
         puts "Here's the crieria"
         list_criteria
      end
    end
  end

  def list_reviews
    puts "Below are the Top 3 most 'overly postive'endorsments in order of severity"

    @reviews = WorstOffenders::Review.today

      @reviews.each.with_index(1) do |review, index|
        puts "#{index}. #{review.heading} - #{review.name}"
      end
  end

  def list_criteria
     puts <<-DOC
      1. have 5 stars
      2. have all CAPS
    DOC
  end

end
