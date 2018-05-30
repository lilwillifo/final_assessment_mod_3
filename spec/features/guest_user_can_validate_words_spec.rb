require 'rails_helper'

#https://developer.oxforddictionaries.com/documentation
# GET /inflections/{source_lang}/{word_id} under the "Lemmatron" heading

describe 'As a guest user' do
  it 'I can validate words on the root page' do
    visit '/'
    word = 'foxes'
    fill_in :word, with: word
    click_on 'Validate Word'

    expect(page).to have_content("'#{word}' is a valid word and its root form is '#{word.root}'.'")
  end
  it 'will tell me if a word is invalid' do
    visit '/'
    word = 'foxez'
    fill_in :word, with: word
    click_on 'Validate Word'

    expect(page).to have_content("'#{word}' is not a valid word.")
    expect(page).to_not have_content("and its root form is")
  end
end
