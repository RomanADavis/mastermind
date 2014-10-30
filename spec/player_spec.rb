# spec/player_spec.rb
require "spec_helper"

module Mastermind
  describe Player do
    context "#initialize" do
      
      it "raises an exception when initialized with {}" do
        expect { Player.new({}) }.to raise_error
      end
      it "does not raise an exception when given a valid input hash" do
        input = { role: "breaker", name: "Roman" }
        expect{ Player.new(input) }.to_not raise_error
      end
    end
    
    context "#name" do  
      it "returns player's name" do
        input = { role: "breaker", name: "Roman" }
        player = Player.new(input)
        expect(player.name).to eq "Roman"
      end
    end
    
    context "#role" do
      it "return player's role" do
        input = { role: "breaker", name: "Roman" }
        player = Player.new(input)
        expect(player.role).to eq "breaker"
      end
    end
  
  end
end