module Calculator
  class Tax

    BRACKETS ||= [
      Bracket.new(nil, 11_500, 0),
      Bracket.new(11_501, 45_000, 20),
      Bracket.new(45_001, 150_000, 40),
      Bracket.new(150_000, nil, 45)
    ]

    class << self
      def find_bracket(income)
        BRACKETS.each do |tax_bracket|
          if tax_bracket.in_bracket?(income)
            return tax_bracket
          end
        end
      end
    end
  end
end
