require 'json'

module Calculator
  class Bracket
    attr_reader :lower_limit, :upper_limit, :percent

    def initialize(lower_limit = nil, upper_limit, percent)
      @lower_limit = lower_limit || 0
      @upper_limit = upper_limit
      @percent = percent || 0
    end

    def to_json
      ::JSON.generate(
        {
          "lower_limit" => @lower_limit,
          "upper_limit" => @upper_limit,
          "percent" => @percent
        }
      )
    end

    def ==(other_instance)
      self.to_json == other_instance.to_json
    end

    def in_bracket?(value)
      (upper_limit.nil? && value >= @lower_limit) ||
      (value > @lower_limit && value < @upper_limit)
    end
  end
end
