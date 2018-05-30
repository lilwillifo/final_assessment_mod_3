class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end




end
