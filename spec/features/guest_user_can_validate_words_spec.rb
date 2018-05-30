require 'rails_helper'

#https://developer.oxforddictionaries.com/documentation
# GET /inflections/{source_lang}/{word_id} under the "Lemmatron" heading

describe 'As a guest user' do
  it 'I can validate words on the root page' do
    VCR.use_cassette('user_can_validate_word') do
      visit '/'
      word = 'foxes'
      fill_in :word, with: word
      click_on 'Validate Word'

      expect(page).to have_content("'#{word}' is a valid word and its root form is '#{Validation.new(word).root}'.")
    end
  end
  it 'will tell me if a word is invalid' do
    VCR.use_cassette('invalidate_non_word') do
      visit '/'
      word = 'foxez'
      fill_in :word, with: word
      click_on 'Validate Word'

      expect(page).to have_content("'#{word}' is not a valid word.")
      expect(page).to_not have_content("and its root form is")
    end
  end
end
