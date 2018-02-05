module Calculate
  class Report < Hash

    def initialize(income)
      raise ArgumentError unless income
      income = income.is_a?(String) ? income.to_i : income

      tax, allowence = Calculate::Tax.tax_and_allowance(income)

      taxable_income = income - allowence
      income_after_tax = income - tax

      self.replace({
        "income" => income,
        "tax_free_allowence" => allowence,
        "taxable_income" => taxable_income,
        "tax_amount" => tax,
        "income_after_tax" => income_after_tax # $$$PROFIT$$$
      })
    end
  end
end
