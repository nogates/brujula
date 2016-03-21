module Inflecto
  class << self
    def ramelize(string)
      camelize(string).tap do |string|
        string[0] = string[0].downcase
      end
    end
  end
end
