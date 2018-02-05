module Calculator
  class Report < Hash

    def initialize(income)
      raise ArgumentError unless income
      income = income.is_a?(String) ? income.to_i : income

      tax_bracket = Calculator::Tax.find_bracket(income)

      tax_rate = ((income/100) * tax_bracket.percent)
      income_after_tax = income - tax_rate

      self.replace({
        "income" => income,
        "tax_rate" => tax_bracket.percent,
        "tax_amount" => tax_rate,
        "income_after_tax" => income_after_tax
      })
    end
  end
end
