class TaxCalculator

  attr_reader :deduction, :brackets

  def initialize(bracket_name:)
    tax_bracket = TaxBrackets.new(bracket_name)
    @brackets = tax_bracket.brackets
    @deduction = tax_bracket.deduction
  end

  def calc_taxes(income)
    taxes = 0.0
    income = income - @deduction
    # puts "Total income to be taxed: #{income}"
    return taxes if income < 1

    @brackets.each do |bracket|
      min = bracket[:min]
      break if min > income

      max = bracket[:max]
      if max != nil && max <= income
        taxable_income = max - min
        # puts "Taxable income: #{taxable_income} @ #{bracket[:percent]}"
        taxes += (taxable_income * bracket[:percent]).round(2)
      end

      if (max == nil || max > income)
        taxable_income = income - min
        # puts "Taxable income: #{taxable_income} @ #{bracket[:percent]}"
        taxes += (taxable_income * bracket[:percent]).round(2)
      end

      # puts "Taxes for this bracket: #{taxes}"
    end

    return taxes
  end

end