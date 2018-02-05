require 'json'

module Bracket
  class Abstract
    attr_reader :lower_limit, :upper_limit, :percent, :allowence

    def initialize(lower_limit = nil, upper_limit = nil, percent = nil, allowence = nil)
      @lower_limit = lower_limit || 0
      @upper_limit = upper_limit
      @percent = percent || 0
      @allowence = allowence || 0
    end

    def calculate_tax(value)
      if in_bracket?(value)
        if @upper_limit && value > @upper_limit
          value_within_bracket = (@upper_limit - @lower_limit).to_f
        else
          value_within_bracket = (value - @lower_limit).to_f
        end
        (value_within_bracket / 100) * @percent
      end
    end

    def in_bracket?(value)
      value >= @lower_limit
    end

  end
end
