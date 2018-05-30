class Api::V1::Games::PlaysController < ApiController
  def create
    player = User.find(params[:user_id])
    if invalid_word?
      render status: 400, json: {message: "#{params[:word]} is not a valid word."}
    else
      player.plays.create(game: current_game, word: params[:word])
      render status: 201, json: current_game
    end
  end

  private
  def invalid_word?
    !Validation.new(params[:word]).is_word?
  end
end
