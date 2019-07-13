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
     puts <<-DOC
      1. first review
      2. second review
    DOC
    @reviews = WorstOffenders::Review.today
  end

  def list_criteria
     puts <<-DOC
      1. have 5 stars
      2. have all CAPS
    DOC
  end

end
