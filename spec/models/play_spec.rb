require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end
    end
    context "#validate_word" do
      it 'validates if the input is a real word' do
        VCR.use_cassette('user_plays_a_valid_word') do
          play = create(:play, word: "foxes")
          expect(play.is_word?).to eq(true)
        end
      end
      it 'tells you if word is not real' do
        VCR.use_cassette('user_plays_invalid_word') do
          play = create(:play, word: "foxez")
          expect(play.is_word?).to eq(false)
        end
      end
    end
  end
end
