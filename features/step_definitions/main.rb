def fixture_folder
  Pathname.new(__dir__).join('..', 'ramls')
end

When(/^I parse the fixture file "([^"]*)"$/) do |fixture_name|
  @pointers = {}
  @raml ||= Brujula.parse_file(fixture_folder.join(fixture_name))
end

Then(/^I inspect the root object$/) do
  @root    = @raml.root
  @pointer = @root
end

Then(/^it has these properties$/) do |table|
  table.rows_hash.each do |name, value|
    value = false if value == 'false'
    value = true  if value == 'true'
    expect(@pointer).to have_accessor(name).with_value(value)
  end
end

Then(/^I inspect the item "([^"]*)" of "([^"]*)" collection$/) do |name, collection|
  map_object = @pointer.send(collection)
  expect(map_object).to have_item(name)

  @pointer = map_object.fetch(name)
end

Then(/^it has this description$/) do |string|
    expect(@pointer).to have_accessor('description').with_value(string)
end

Then(/^I inspect the property "([^"]*)"$/) do |name|
  expect(@pointer).to have_accessor(name)
  @pointer = @pointer.send(name)
end

Then(/^I inspect the parent object$/) do
  @pointer = @pointer.parent
  if @pointer.is_a?(Brujula::MapObject)
    @pointer = @pointer.parent
  end
end

Then(/^the value of the property "([^"]*)" is an array of$/) do |property, table|
  expect(@pointer.send(property)).to match_array table.raw.flatten
end

Then(/^I store it as object "([^"]*)"$/) do |name|
  @pointers[name] = @pointer
end

Then(/^I inspect the object "([^"]*)"$/) do |name|
  @pointer = @pointers.fetch(name)
end

Then(/^it has this "([^"]*)"$/) do |name, value|
  expect(@pointer).to have_accessor(name).with_value(value)
end
