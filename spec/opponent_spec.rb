require 'opponent'

describe Opponent do
  let(:opponent) {described_class}
  let(:player_name) {double :player_name}
  let(:player_id) {player_name.object_id}

  context 'class methods' do

    describe '.opponents' do

      it 'stores @opponents when .add is called' do
        expect{opponent.add(player_id, player_name)}.to change{opponent.opponents.size}.by(1)
      end
    end

    describe '.add' do

      before do
        opponent.add(player_id, player_name)
      end

      it '.adds an Opponent class object to the @opponents hash' do
        expect(opponent.opponents).to include ({player_id => player_name})
      end
    end

    describe '.look_up' do

      before do
        opponent.add(player_id, player_name)
      end

      it 'will .look_up a Player class object' do
        expect(opponent.look_up(player_id)).to eq player_name
      end
    end

  end


  context 'instance methods' do
    let(:name) {double :name}
    let(:weapon_choice) {double :weapon_choice}
    let(:weapon_choice_2) {double :weapon_choice_2}
    subject(:real_opponent) {described_class.new(name, weapon_choice)}

    describe '#initialize' do

      it 'stores the opponent\'s weapon' do
        expect(real_opponent.weapon).to eq weapon_choice
      end

      it 'stores the opponent\'s name' do
        expect(real_opponent.name).to eq name
      end

    end

    describe '#assign_weapon' do

      it 'allows the weapon to be reassigned' do
        real_opponent.assign_weapon(weapon_choice_2)
        expect(real_opponent.weapon).to eq weapon_choice_2
      end
    end
  end
end
