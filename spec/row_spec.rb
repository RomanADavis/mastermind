# spec/row_spec.rb
require "spec_helper"

module Mastermind
  describe Row do
  
    context "#initialize" do
      it "has four elements by default" do
        row = Row.new
        expect(row.slots.length).to eq 4
      end
        
      it "a slot can't have a value higher than 6" do # These test end up testing for internal structures and
        row = Row.new                                 # they are made unnecessary by slot_spec.rb, writing
        ex = row.slots.map {|i| i.value}              # this was just to test if I could compare values of
        expect(ex.max).to be <= 6                     #  instances of the same class.
      end
      
      it "a slot can't have a value lower than 1" do  # Ditto above
        row = Row.new
        ex = row.slots.map {|i| i.value}
        expect(ex.min).to be >= 1
      end
      
      it "can be initialized with slots" do
        row = Row.new(slots: "grid")
        expect{ row.slots }.to_not raise_error
      end
    end
    
    context "#slots" do
      it "returns the slots" do
        row = Row.new(slots: [1,2,3,4])
        expect(row.slots).to eq [1,2,3,4]
      end
    end
    
    context "#get_slot" do
      it "returns the slot based on an index" do
        slots = [1,2,3,4]
        row = Row.new(slots: slots)
        expect(row.get_slot(3)).to eq 4
      end
    end
    
    context "#set_slot" do
      it "updates the value at the index" do
        Cat = Struct.new(:value)
        slots = [Cat.new("meow"), 2, 3, 4]
        row = Row.new(slots: slots)
        row.set_slot(0, 1)
        expect(row.get_slot(0).value).to eq 1
      end
    end
    
  end
end