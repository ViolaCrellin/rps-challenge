def sign_up
  visit '/'
  fill_in "player_name", with: 'Soulless Marketeer'
  check "opponent_name"
  click_button "Bore me now!"
end

def sign_up_multiplayer
  visit '/'
  fill_in "player_name", with: 'Soulless Marketeer'
  fill_in "opponent_name", with: '"Friend"'
  click_button "Bore me now!"
end

def sign_up_multiplayer_missing
  visit '/'
  fill_in "opponent_name", with: '"Friend"'
  click_button "Bore me now!"
end
