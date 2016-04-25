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

  describe 'raml_type_inheritance' do
    describe 'Type Person' do
      let(:person) { raml.root.types.fetch('Person') }
      subject { person }

      its(:type) { is_expected.to eq('object') }

      describe 'properties #name' do
        subject { person.properties.fetch('name') }

        its(:type)     { is_expected.to eq('string') }
      end
    end

    describe 'Type Employee' do
      let(:employee) { raml.root.types.fetch('Employee') }
      subject { employee }

      its(:type) { is_expected.to eq('Person') }

      describe 'properties #id' do
        subject { employee.properties.fetch('id') }

        its(:type)     { is_expected.to eq('string') }
      end

      describe 'properties #name' do
        subject { employee.properties.fetch('name') }

        its(:type)     { is_expected.to eq('string') }
      end
    end
  end

  describe 'raml_type_multiple_inheritance' do
    describe 'Type Person' do
      let(:person) { raml.root.types.fetch('Person') }
      subject { person }

      its(:type) { is_expected.to eq('object') }

      describe 'properties #name' do
        subject { person.properties.fetch('name') }

        its(:type) { is_expected.to eq('string') }
      end
    end

    describe 'Type EmailOwner' do
      let(:email_owner) { raml.root.types.fetch('EmailOwner') }
      subject { email_owner }

      its(:type) { is_expected.to eq('object') }

      describe 'properties #email' do
        subject { email_owner.properties.fetch('email') }

        its(:type) { is_expected.to eq('string') }
      end
    end

    describe 'Type Employee' do
      let(:employee) { raml.root.types.fetch('Employee') }
      subject { employee }

      its(:type) { is_expected.to eq([ "Person", "EmailOwner" ]) }

      describe 'properties #id' do
        subject { employee.properties.fetch('id') }

        its(:type) { is_expected.to eq('string') }
      end

      describe 'properties #name' do
        subject { employee.properties.fetch('name') }

        its(:type) { is_expected.to eq('string') }
      end

      describe 'properties #email' do
        subject { employee.properties.fetch('email') }

        its(:type) { is_expected.to eq('string') }
      end
    end
  end
end
