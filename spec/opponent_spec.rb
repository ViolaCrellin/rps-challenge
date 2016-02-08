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
    subject(:opponent) {described_class.new(name)}

    describe '#initialize' do


      it 'stores the opponent\'s name' do
        expect(opponent.name).to eq name
      end

    end

    describe '#assign_weapon' do

      xit 'stores the weapon choice' do
        allow(weapon_choice).to receive(:to_sym)
        opponent.assign_weapon(weapon_choice)
        expect(opponent.weapon).to eq weapon_choice
      end
    end
  end
end
