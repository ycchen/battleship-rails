# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InviteSerializer, type: :serializer do
  let(:player_1) { create(:player) }
  let(:player_2) { create(:player) }
  let(:invite) { create(:invite, player_1: player_1, player_2: player_2) }
  let(:serializer) { InviteSerializer.new(invite) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }
  let(:json) { JSON.parse(serialization.to_json) }

  it 'is json' do
    expect(json['id']).to eq(invite.id)
    expect(json['game_id']).to be_nil
    expect(json['player_1_id']).to eq(invite.player_1_id)
    expect(json['player_2_id']).to eq(invite.player_2_id)
    expect(json['rated']).to eq('1')
    expect(json['five_shot']).to eq('1')
    expect(json['time_limit']).to eq(86_400)
  end
end
