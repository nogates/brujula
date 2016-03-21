def valid_values?(key_value, values)
  if values.is_a?(Hash)
    values.all? { |key, value| value == key_value.send(key) }
  else
    key_value == values
  end
end

def retrieve_value(object, key)
  chunks = key.split('.')

  return object.send(key) if chunks.size == 1
  chunks.inject(object) do |return_value, chunk|
    return_value.send(chunk)
  end
rescue NoMethodError
  raise NoMethodError, "Object `#{ object.to_s }` does not implement accessor `#{ key }`"
end

def retrieve_object(object, key)
  object.fetch(key)
rescue KeyError
  raise KeyError, "Object `#{ object.to_s }` does not contain item `#{ key }`"
end


RSpec::Matchers.define :have_accessor do |key|
  attr_reader :key_class

  match do |actual|
    key_value  = retrieve_value(actual, key)
    if key_class_sym.is_a?(Symbol)
      @key_class = Brujula::Raml::V1_0.const_get(Inflecto.camelize(key_class_sym)) if key_class_sym
    else
      @key_class = key_class_sym
    end
    (key_class_sym == nil || key_value.is_a?(key_class)) &&
    (values == nil || valid_values?(key_value, values))
  end

  chain :as, :key_class_sym
  chain :with_value, :values
  chain :with_values, :values

  failure_message do |actual|
    "could not match key `#{ key }` in `#{ actual.class.name }` as `#{ key_class }` with "
  end
end

RSpec::Matchers.define :have_item do |item_name|
  attr_reader :key_class

  match do |actual|
    object_value = retrieve_object(actual, item_name)
    @key_class = Brujula::Raml::V1_0.const_get(Inflecto.camelize(key_class_sym)) if key_class_sym
    (key_class_sym == nil || object_value.is_a?(key_class)) &&
    (values == nil || valid_values?(object_value, values))
  end

  chain :as, :key_class_sym
  chain :with_values, :values

  failure_message do |actual|
    "could not match item `#{ item_name }` in `#{ actual.class.name }` as `#{ key_class }`"
  end
end



# match do |actual|
#     (actual > first) && (actual < second)
#   end
#
#   chain :and_smaller_than, :second
