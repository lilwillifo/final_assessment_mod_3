class Play < ApplicationRecord
  belongs_to :user
  belongs_to :game

  before_save :score_word

  def letter_scores
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
      "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10
    }
  end

  def score
    score_word
  end

  def is_word?
    Validation.new(word).is_word?
  end

  def status
    if is_word?
      201
    else
      400
    end
  end

  def message
    if is_word?
      "#{word} was played."
    else
      "#{word} is not a valid word."
    end
  end
  private
    def score_word
      if is_word?
        word.upcase.chars.map do |letter|
          letter_scores[letter]
        end.sum
      else
        0
      end
    end
end
