require 'calc'
require 'tax_brackets'

describe "given the current tax bracket" do

  before :each do
    @bracket_name = "current"
  end

  context "when paying taxes" do

    before :each do
      @calculator = TaxCalculator.new(bracket_name: @bracket_name)
    end

    it "$45000 income pays $5576.25 in taxes" do
      expect(@calculator.calc_taxes(45000.00)).to eq(5576.25)
    end

    it "$44000 income pays $5181.25 in taxes" do
      expect(@calculator.calc_taxes(44000.00)).to eq(5181.25)
    end

    it "$45002 income pays $5577.25 in taxes" do
      expect(@calculator.calc_taxes(45002.00)).to eq(5577.25)
    end
  end
end

describe "given the house tax bracket" do

  before :each do
    @bracket_name = "house"
  end

  context "when paying taxes" do

    before :each do
      @calculator = TaxCalculator.new(bracket_name: @bracket_name)
    end

    it "$45000 income pays $3936 in taxes" do
      expect(@calculator.calc_taxes(45000.00)).to eq(3936.00)
    end

    it "$44000 income pays $3816 in taxes" do
      expect(@calculator.calc_taxes(44000.00)).to eq(3816.00)
    end

    it "$45002 income pays $3936 in taxes" do
      expect(@calculator.calc_taxes(45002.00)).to eq(3936.24)
    end
  end
end

describe "given the house tax bracket" do

  before :each do
    @bracket_name = "senate"
  end

  context "when paying taxes" do

    before :each do
      @calculator = TaxCalculator.new(bracket_name: @bracket_name)
    end

    it "$45000 income pays $3769.50 in taxes" do
      expect(@calculator.calc_taxes(45000.00)).to eq(3769.50)
    end

    it "$44000 income pays $3649.50 in taxes" do
      expect(@calculator.calc_taxes(44000.00)).to eq(3649.50)
    end

    it "$45002 income pays $3769.74 in taxes" do
      expect(@calculator.calc_taxes(45002.00)).to eq(3769.74)
    end
  end
end