class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{'user_id': object.player_1_id ,
      'score': sum_scores(object.player_1_id),
    },
    {'user_id': object.player_2_id ,
      'score': sum_scores(object.player_2_id),
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
