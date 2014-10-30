# lib/mastermind/slot.rb

module Mastermind
  class Slot
    attr_accessor :value
    def initialize value=rand(1..6)
      @value = value
    end
  end
end