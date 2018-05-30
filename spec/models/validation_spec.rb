require 'spec_helper'

describe Validation do
  it 'exists' do
    VCR.use_cassette('validation_of_word') do
      validation = Validation.new('foxes')
      expect(validation).to be_a Validation
    end
  end
  context 'instance methods' do
    it 'can check for a word' do
      VCR.use_cassette('validation_of_word') do
        validation = Validation.new('foxes')
        expect(validation.input).to eq('foxes')
        expect(validation.is_word?).to eq true
      end
    end
    it 'can verify if input is not a word' do
      VCR.use_cassette('invalidate_non_word') do
        validation = Validation.new('foxez')
        expect(validation.input).to eq('foxez')
        expect(validation.is_word?).to eq false
      end
    end
    it 'can find the root' do
      VCR.use_cassette('validation_of_word') do
        validation = Validation.new('foxes')
        expect(validation.root).to eq('fox')
      end
    end
  end
end
