require 'spec_helper'


feature 'Both players can choose weapons' do

  before do
    sign_up_multiplayer
  end

  xscenario 'The p1 chooses rock and p1 chooses scissors' do

    find("weapon_choice_1").find_button("rock")
    find("#weapon_choice_2").find_button("scissors")
    click_button("Chosen")
    expect(page).to have_content('Soulless Marketeer chose rock and "Friend" chose scissors')
  end
end
