require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do 
    visit new_user_url
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content("Create User")
  end
  
  feature 'signing up a user' do
    
    scenario 'shows username on the homepage after signup' do
      fill_in 'username', with: 'coffeebarra'
      fill_in 'password', with: 'starwars'
      click_button 'Create!'
      expect(page).to have_content('coffeebarra')
    end
  end
end

feature 'logging in' do
  background :each do 
    visit new_session_url
  end
  scenario 'shows username on the homepage after login' do 
    user = User.new(username: 'coffeebarra', password: 'starwars')
    fill_in 'username', with: 'coffeebarra'
    fill_in 'password', with: 'starwars'
    click_button 'Logon'
    
    expect(page).to have_content('coffeebarra')
  end
    
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end 