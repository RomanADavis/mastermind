# lib/mastermind/game.rb
module Mastermind
  class Game
    attr_reader :player, :name, :role, :row, :guesses, :current_guess
    def initialize(player, row = Row.new.slots.map {|slot| slot.value})
      @player = player
      @name = player.name
      @role = player.role
      @row = row
      @guesses = 6
      @current_guess = ["_", "_", "_", "_"]
    end
    
    def evaluate_guess(guess=@current_guess)
      clone = @row
      rating = []
      guess.each_with_index do |slot, index|
        if clone.include? slot
          if clone[index] == guess[index]
            rating << "O"
          else
            rating << "_"
          end
        else
          rating << "X"
        end
      end
      rating.join("")
    end
    
    def solicit_guess
      "#{player.name}: Enter 4 digits, that can be any digit between 1 and 6. Use one input."
    end
    
    def get_guess(current_guess=gets.chomp)
      @current_guess = current_guess.split("").map {|i| i.to_i}
      @guesses -= 1
    end
    
    def won?
      evaluate_guess == "OOOO" ? true : false
    end
    
    def lost?
      guesses == 0 ? true : false
    end
    
    def game_over_message
      return "Congratz! You won, #{@name}!" if won?
      return "You are out of guesses. The answer was #{@row.join}." if guesses == 0
    end
    
    def instructions
      "Welcome to Mastermind. Try to crack the code. Correct digits are returned as 'O', incorrect as 'X', and if the" + "\n" +
      "number is somewhere else in the code, '_'. Codes are 4 digit numbers, with each digit between 1 and 6."
    end
    
    def guess_count
      "You have #{@guesses} guesses left."
    end
    
    def play
      puts instructions
      while true
        puts ""
        puts solicit_guess
        get_guess
        puts evaluate_guess
        if won? or lost?
          puts game_over_message
          return
        end
        puts guess_count
      end
    end
  
  end
end