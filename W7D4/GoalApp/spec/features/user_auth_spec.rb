require 'spec_helper'
require 'rails_helper'

# feature 'Sign Up' do 
#     background :each do 
#         visit new_user_url
#     end

#     scenario 'has a sign-up page' do 
#         expect(page).to have_content('Create New User')
#     end

#     scenario 'it accepts log-in credentials' do
#         expect(page).to have_content('Username')
#         expect(page).to have_content('email')
#         expect(page).to have_content('password')
#     end
# end

feature 'the signup process' do
  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Email')
  end

  scenario 'signing up a user' do
    it 'it should successfully sign up a user' do
        fill_in 'user[username]', with: 'hellokitty'
        fill_in 'email', with: 'kitty@fmail.com'
        fill_in 'Password', with: '888' 
        
        click_button 'Sign Up'
        
        scenario 'shows username on the homepage after signup' do
            user = User.find_by(username: 'hellokitty')
            expect(page).to have_content('hellokitty')
            expect(current_url).to eq(user_url(user))
        end
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end