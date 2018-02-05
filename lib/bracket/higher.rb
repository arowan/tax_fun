module Bracket
  class Higher < Abstract

    def initialize
      super(45_001, 150_000, 40, 11_500)
    end

    # personal allowence decreases by 1 for every 2 over 100_000
    def calculate_allowence(income)
      if income > 100_000
        @allowence - ((income - 100_000) / 2)
      else
        @allowence
      end
    end

    alias_method :allowence, :calculate_allowence

  end
end
