class Brujula::TransformerFunctions
  def call(string, function)
    function_ref = get_function_name(function)

    send(function_ref, string)
  end

  private

  def get_function_name(function)
    name = Inflecto.underscore(function).gsub(/^!/, '').to_sym

    return name if private_methods.include?(name)

    raise "Invalid trasformer function #{ function }"
  end

  def singularize(string)
    Inflecto.singularize(string)
  end

  def pluralize(string)
    Inflecto.pluralize(string)
  end

  def uppercase(string)
    string.upcase
  end

  def lowercase(string)
    string.downcase
  end

  def lowercamelcase(string)
    Inflecto.ramelize(string)
  end

  def uppercamelcase(string)
    Inflecto.camelize(string)
  end

  def lowerunderscorecase(string)
    Inflecto.underscore(string)
  end

  def upperunderscorecase(string)
    Inflecto.underscore(string).upcase
  end

  def lowerhyphencase(string)
    Inflecto.dasherize(Inflecto.underscore(string)).downcase
  end

  def upperhyphencase(string)
    Inflecto.dasherize(Inflecto.underscore(string)).upcase
  end
end
