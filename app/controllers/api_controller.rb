class ApiController < ActionController::API
  private
  def current_game
    game_id = params[:game_id] || params[:id]
    @game ||= Game.find(game_id)
  end
end
