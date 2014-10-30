# spec/slot_spec.rb
require "spec_helper"

module Mastermind
  describe Slot do
    context "#initialize" do
      it "is initialzed with a number greater than 0" do
        1000.times do
          slot = Slot.new
          expect(slot.value).to be > 0
        end
      end
      it "is initialized with a number less than 7" do
        1000.times do
          slot = Slot.new
          expect(slot.value).to be < 7
        end
      end
    end
  end
end