class Api::V1::Games::PlaysController < ApiController
  def create
    game = Game.find(params[:game_id])
    player = User.find(params[:user_id])
    player.plays.create(game: game, word: params[:word])
    render status: 201, json: game
  end
end
