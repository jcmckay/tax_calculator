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

    it "$1 income pays $0 in taxes" do
      expect(@calculator.calc_taxes(1)).to eq(0)
    end

    it "$100000 income pays $18138.75 in taxes" do
      expect(@calculator.calc_taxes(100000.00)).to eq(18138.75)
    end

    it "$44000 income pays $4573.75 in taxes" do
      expect(@calculator.calc_taxes(44000.00)).to eq(4573.75)
    end

    it "$45002 income pays $5577.25 in taxes" do
      expect(@calculator.calc_taxes(45002.00)).to eq(4724.05)
    end

    it "$1000000 income pays $347700.45 in taxes" do
      expect(@calculator.calc_taxes(1000000)).to eq(347700.45)
    end
  end
end