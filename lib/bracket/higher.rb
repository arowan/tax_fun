module Bracket
  class Higher < Abstract

    def initialize
      super(45_001, 150_000, 40, 11_500)
    end

    def in_bracket?(value)
      calculate_allowence(value)
      super
    end

    def allowence
      @calulated_allowence || @allowence
    end

    private

    # personal allowence decreases by 1 for every 2 over 100_000
    def calculate_allowence(income)
      if income > 100_000
        @calulated_allowence = (@allowence - ((income - 100_000) / 2))
      end
    end

  end
end
