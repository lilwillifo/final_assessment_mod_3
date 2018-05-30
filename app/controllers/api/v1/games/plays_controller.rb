class Api::V1::Games::PlaysController < ApiController
  def create
    game = Game.find(params[:game_id])
    
    render status: 201, json: game
  end
end
