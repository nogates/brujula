Brújula
========

[![Build Status](https://travis-ci.org/nogates/brujula.svg?branch=master)](https://travis-ci.org/nogates/brujula)
[![Code Climate](https://codeclimate.com/github/nogates/brujula/badges/gpa.svg)](https://codeclimate.com/github/nogates/brujula)
[![Test Coverage](https://codeclimate.com/github/nogates/brujula/badges/coverage.svg)](https://codeclimate.com/github/nogates/brujula/coverage)

_Yet another Ruby RAML parser aiming for version 1.0 fully support_

# Status

Brujula is still under development and not the full RAML specification is covered. Please see `SPEC_SUPPORT.md` for more information.

# Use

Install the gem `brujula` via your preferred method, and use `parse_file` to load and parse any RAML file

```ruby
require 'brujula'

raml = Brujula.parse_file('path/my_example_api.raml')

# Alternatively

raml_string = <<-RAML
# version 1.0
title: 'My example API'
/examples:
  get:

RAML

raml = Brujula.parse_string(raml_string)
```

As expected, the properties of the root object can be accessed from the root object

```ruby
raml.root.title
=> 'My example API'
```

Object collections, such as Resources, Methods or Security Schemes, inherits from `Brujula::MapObject`, which implements the `Enumerable` module. Thus, you can use any of this module's method to get collection objects.

```ruby
raml.root.resources.each_with_object([]) do |resource, resource_names|
  resource_names << resource.name
end
```

Alternatively, you can you use hash methods such as `[]` or `fetch` to get specific objects by its key name

```ruby
raml.root.resources['/examples']
```


## Contributing

Pull request are kindly requested. Specially in the form of RAML examples. If you are using some advances features of RAML 1.0 spec, like annotations, type inheritance or libraries, and you would like to help this project, please have a look at `CONTRIBUTING.md`.

## License

The MIT License (MIT)

Copyright (c) 2014 David

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
