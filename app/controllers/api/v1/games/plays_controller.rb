class Api::V1::Games::PlaysController < ApiController
  def create
    play = player.plays.create(game: current_game, word: params[:word])
    render status: play.status, json: {message: play.message}
  end

  private
  def player
    User.find(params[:user_id])
  end
end
