class WorstOffenders::CLI

  def call
    puts "Welcome to the CLI - Worst offenders for overly positive reviews - McKaig Chevrolet Buick"
    start
  end

  def start
    input = nil
    while input != "exit"
      puts "Would you like to view the Top 3 offenders of submitting overly positive reviews (y to view top 3/n to view list criteria/ exit to quit) ?"
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

    @reviews = WorstOffenders::Review.top_offenders

      @reviews.each.with_index(1) do |review, index|
        puts "#{index}. #{review.heading} - #{review.user} "
        puts "#{review.content}"
      end
  end

  def list_criteria
     puts <<-DOC
      1. They are among the most recent reviewers that appear on the website
      2. Their review contains the phrase "Best car buying experience"
      3. Their usernames are in alphabetical order going from (A - Z)
    DOC
  end

end
