class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def scores
    [{'user_id': self.player_1_id ,
      'score': sum_scores(self.player_1_id),
    },
    {'user_id': self.player_2_id ,
      'score': sum_scores(self.player_2_id),
    }]
  end

  private
  def sum_scores(player_id)
    player = User.find(player_id)
    player.plays.map do |play|
      play.score
    end.sum
  end
end
