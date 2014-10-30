# spec/game_spec.rb
require "spec_helper"

module Mastermind
  describe Game do
    let (:player) { Player.new({role: "breaker", name: "Roman"}) }
    let (:row) { [1,2,3,4] }
    let (:game) { Game.new(player, row)}

    context "#initialize" do
      it "can be initialized with a player" do
        expect{ Game.new(player) }.to_not raise_error
      end
      it "can be initialized with a player and a row" do
        expect{ Game.new(player, row) }.to_not raise_error
      end
    end
    
    context "#player" do
      it "returns player" do
        expect(game.player).to eq player
      end
    end
    
    context "#row" do
      it "should return an array of four ints" do
        expect(game.row.length).to eq 4
        expect(game.row.all? {|i| i.is_a? Fixnum}).to eq true
      end
    end
    
    context "#evaluate_guess do" do
      it "game should be initialized with incorrect guess" do
        expect(game.evaluate_guess).to eq "XXXX"
      end
      
      it "should return ['O','O','O','O'] for a correct guess" do
        expect(game.evaluate_guess([1,2,3,4])).to eq "OOOO"
      end
      
      it "should return '_' for a num that is in the wrong place" do
        expect(game.evaluate_guess([0,0,0,1])).to eq "XXX_"
      end
    end
    
    context "#get_guess" do
      it "changes current guess" do
        game.get_guess("6661")
        expect(game.current_guess).to eq [6,6,6,1]
      end
      it "subtracts from guesses" do
        game.get_guess("5555")
        expect(game.guesses).to eq 5
      end
    end
    
    context "#won?" do
      it "returns won if current_guess == row" do
        game.get_guess("1234")
        expect(game.won?).to eq true
      end
      it "returns false by default" do
        expect(game.won?).to eq false
      end
    end
    
    context "lost?" do
      it "returns false by default" do
        expect(game.lost?).to eq false
      end
      it "returns true if guesses == 0" do
        6.times { game.get_guess("5555") }
        expect(game.lost?).to eq true
      end
    end
    
    context "#game_over_message" do
      it "says congratz message if you guessed right" do
        game.get_guess("1234")
        expect(game.game_over_message).to eq "Congratz! You won, Roman!"
      end
      it "says the right thing if you lost" do
        6.times {game.get_guess("5555")}
        expect(game.game_over_message).to eq "You are out of guesses. The answer was 1234."
      end
    end
    
    
  end
end