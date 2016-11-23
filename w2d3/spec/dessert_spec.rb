require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("cookie", 10, chef) }
  let(:chef) { double("chef", name: "Vin") }

  describe "#initialize" do
    #subject(:dessert) { Dessert.new("cookie", 10, "Vin") }

    it "sets a type" do
      expect(dessert.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "no", "Vin") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include('flour')
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "eggs", "chocolate chips", "sugar", "butter"]

      ingredients.each do |el|
        dessert.add_ingredient(el)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(10)
      dessert.eat(4)
      expect(dessert.quantity).to eq(6)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(11) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Vin the Great Baker")
      expect(dessert.serve).to eq("Chef Vin the Great Baker has made 10 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end

end
