require 'spec_helper'

describe Validation do
  it 'exists' do
    validation = Validation.new('foxes')
    expect(validation).to be_a Validation
  end
  it 'has valid attributes' do
    validation = Validation.new('foxes')
    expect(validation.input).to eq('foxes')
    expect(validation.is_word?).to eq true
  end
  it 'can verify if input is not a word' do
    validation = Validation.new('foxez')
    expect(validation.input).to eq('foxez')
    expect(validation.is_word?).to eq false
  end
end
