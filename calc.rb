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

    @brackets.each do |bracket|
      min = bracket[:min]
      break if min > income

      max = bracket[:max]
      if max <= income
        taxable_income = max - min
        taxes += (taxable_income * bracket[:percent]).round(2)
      end

      if max == nil || max > income
        taxable_income = income - min
        taxes += (taxable_income * bracket[:percent]).round(2)
      end
    end

    return taxes
  end

end