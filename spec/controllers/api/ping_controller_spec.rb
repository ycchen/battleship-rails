# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PingController, type: :controller do
  let(:player) { create(:player, :confirmed) }

  describe 'GET #index' do
    let(:json) { JSON.parse(response.body) }

    it 'returns http success' do
      get :index, params: { format: :json }, session: { player_id: player.id }
      expect(response).to be_successful
      expected = { 'id' => player.id }
      expect(json).to eq(expected)
    end
  end
end
