require 'spec_helper'

RSpec.describe Brujula::Scheme do
  let(:test_class) { Class.new() }
  let(:options)    { {} } 
  let(:block)      { -> {} }

  subject { described_class.new(test_class, options, block) }

  describe '.initialize' do
    context 'when the block defines a key' do
      let(:block) { -> { key :test_property, as: Brujula::Raml::V1_0::String } }

      it 'creates the creates an attr_reader on the class' do
        expect(test_class).to receive(:attr_reader).with(:test_property)
        subject
      end

      it 'stores the key' do # TODO
        expect(subject.keys.keys).to include(:test_property)
      end
    end
  end

  describe '#validate_data' do
    context 'when there is a required option' do
      let(:block) do
        -> {
          key :test_optional, as: Brujula::Raml::V1_0::String
          key :test_required, as: Brujula::Raml::V1_0::String, required: true
        }
      end

      context 'when data is empty' do
        let(:data) { {} }

        it 'raises Brujula::Raml::RequiredProperty' do
          expect { subject.validate_data!(data) }
            .to raise_error Brujula::Raml::RequiredProperty
        end
      end

      context 'when missing required data missing' do
        let(:data) { { 'testOptional' => 'present!'} }

        it 'raises Brujula::Raml::RequiredProperty' do
          expect { subject.validate_data!(data) }
            .to raise_error Brujula::Raml::RequiredProperty
        end
      end

      context 'when all data is present' do
        let(:data) { { 'testOptional' => 'present!', 'testRequired' => 'm2' } }

        it 'does not raise Brujula::Raml::RequiredProperty' do
          expect { subject.validate_data!(data) }
            .to_not raise_error
        end
      end

      context 'when only required data is present' do
        let(:data) { { 'testRequired' => 'm2' } }

        it 'does not raise Brujula::Raml::RequiredProperty' do
          expect { subject.validate_data!(data) }
            .to_not raise_error
        end
      end
    end
  end
end
