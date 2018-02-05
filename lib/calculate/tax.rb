require_relative '../bracket'

module Calculate
  class Tax

    BRACKETS ||= [
      ::Bracket::Abstract.new(nil, 11_500, 0, 11_500),
      ::Bracket::Abstract.new(11_501, 45_000, 20, 11_500),
      ::Bracket::Higher.new,
      ::Bracket::Abstract.new(150_000, nil, 45, 0)
    ]

    class << self
      def tax_and_allowance(income)
        BRACKETS.inject([0,0]) do |tax_and_allowance, tax_bracket|
          if tax_bracket.in_bracket?(income)
            tax = tax_and_allowance[0] + tax_bracket.calculate_tax(income)
            tax_and_allowance = [tax, tax_bracket.allowence]
          end
          tax_and_allowance
        end
      end
    end
  end
end
