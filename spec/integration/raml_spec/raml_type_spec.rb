require 'spec_helper'

describe 'Resource RAML SPEC examples', type: :raml_spec do
  describe 'raml_type_property_declaration' do
    let(:person) { raml.root.types.fetch('Person') }
    subject { person }

    its(:type) { is_expected.to eq('object') }

    describe 'properties #name' do
      subject { person.properties.fetch('name') }

      its(:type)     { is_expected.to eq('string') }
      its(:required) { is_expected.to eq(true) }
    end

    describe 'properties #age' do
      subject { person.properties.fetch('age') }

      its(:type)     { is_expected.to eq('number') }
      its(:required) { is_expected.to eq(false) }
    end
  end

  describe 'raml_type_property_declaration_alternative_syntax' do
    let(:person) { raml.root.types.fetch('Person') }
    subject { person }

    its(:type) { is_expected.to eq('object') }

    describe 'properties #name' do
      subject { person.properties.fetch('name') }

      its(:type)     { is_expected.to eq('string') }
      its(:required) { is_expected.to eq(true) }
    end

    describe 'properties #age' do
      subject { person.properties.fetch('age') }

      its(:type)     { is_expected.to eq('number') }
      its(:required) { is_expected.to eq(false) }
    end
  end
end
