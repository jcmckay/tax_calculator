class TaxBrackets

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def brackets
    self.send("#{@name}_brackets")
  end

  def deduction
    @deduction
  end

  private
  def current_brackets
    @deduction = 10400.00
    # 6350 + 4050

    [
      {
        min: 0,
        max: 9325.00,
        percent: 0.10
      },
      {
        min: 9325.01,
        max: 37950.00,
        percent: 0.15
      },
      {
        min: 37950.01,
        max: 91900.00,
        percent: 0.25
      },
      {
        min: 91900.01,
        max: 191650.00,
        percent: 0.28
      },
      {
        min: 191650.01,
        max: 416700.00,
        percent: 0.33
      },
      {
        min: 416700.01,
        max: 418400.00,
        percent: 0.35
      },
      {
        min: 418400.01,
        max: nil,
        percent: 0.396
      }

    ]
  end

  def final_brackets
    @deduction= 12000

    [
      {
        min: 0,
        max: 9525.00,
        percent: 0.10
      },
      {
        min: 9525.01,
        max: 38700.00,
        percent: 0.12
      },
      {
        min: 38700.01,
        max: 82500.00,
        percent: 0.22
      },
      {
        min: 82500.01,
        max: 157500.00,
        percent: 0.24
      },
      {
        min: 157500.01,
        max: 200000.00,
        percent: 0.32
      },
      {
        min: 200000.01,
        max: 500000.00,
        percent: 0.35
      },
      {
        min: 500000.01,
        max: nil,
        percent: 0.37
      },
    ]
  end
end