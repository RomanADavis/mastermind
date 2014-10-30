# lib/mastermind/row.rb
module Mastermind
  class Row
    attr_accessor :slots
    def initialize input={}
      @slots = input.fetch(:slots, random_row)
    end
    
    def get_slot index
      slots[index]
    end
    
    def set_slot index, value
      get_slot(index).value = value
    end
    
    private
    def random_row
      Array.new(4) { Slot.new }
    end
  end
end