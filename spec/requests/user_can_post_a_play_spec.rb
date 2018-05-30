require 'rails_helper'

describe 'Api::V1::Games' do
  context 'GET /api/v1/games/1' do
    let(:josh)  { User.create(id: 1, name: "Josh") }
    let(:sal)  { User.create(id: 2, name: "Sal") }
    let(:game)  { Game.create(player_1: josh, player_2: sal) }
    it 'returns the game id and each users score as JSON' do
      josh.plays.create(game: game, word: "sal", score: 3)
      josh.plays.create(game: game, word: "zoo", score: 12)
      sal.plays.create(game: game, word: "josh", score: 14)
      sal.plays.create(game: game, word: "no", score: 2)

      payload = {
                  user_id: josh.id,
                  word: 'at'
                }

      post "/api/v1/games/#{game.id}/plays", params: payload

      expect(response.status).to eq(201)

      get "/api/v1/games/#{game.id}"

      expect(response.status).to eq(200)

      game_response = JSON.parse(response.body, symbolize_names: true)

      expect(game_response.keys).to eq([:game_id, :scores])
      expect(game_response[:game_id]).to eq(game.id)
      expect(game_response[:scores]).to be_an Array
      expect(game_response[:scores].first[:user_id]).to eq 1
      expect(game_response[:scores].first[:score]).to eq 17
      expect(game_response[:scores][1][:user_id]).to eq 2
      expect(game_response[:scores][1][:score]).to eq 16
    end
  end
end
