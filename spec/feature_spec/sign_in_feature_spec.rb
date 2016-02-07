require 'spec_helper'

feature 'Player Set up' do


  scenario 'Signing up' do
    sign_up
    expect(page).to have_content('Soulless Marketeer')
  end

  scenario 'Signing up for multiplayer' do
    sign_up_multiplayer
    expect(page).to have_content('Soulless Marketeer and "Friend"')
  end


end
