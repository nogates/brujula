module Brujula
  module Raml
    class RequiredProperty < StandardError; end
    class ObjectTypeNotFound < StandardError; end
    class InvalidTypeReference < KeyError; end
  end
end
