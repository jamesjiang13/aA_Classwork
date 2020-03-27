require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}

  it {should validate_uniqueness_of(:username)}
  it {should validate_uniqueness_of(:email)}

  subject(:user) { FactoryBot.create(:user) }

  describe 'password encryption' do 
    it 'does not save the password to the database' do 
      FactoryBot.create(:user, username: 'hellokitty')
      user = User.find_by(username: 'hellokitty')
      expect(user.password).to_not be ('password')
    end

    it 'encrypts password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('123')
      FactoryBot.build(:user, password: '123')
    end

  end

  describe 'ensure_session_token' do 
    it 'assign a session token if none is given' do
      expect(FactoryBot.create(:user).session_token).to_not be nil
    end
  end

  describe 'reset_session_token' do
    it 'changes the session token' do 
      FactoryBot.create(:user, username: 'hellokitty')
      user = User.find_by(username: 'hellokitty')
      session_token1 = user.session_token
      expect(user.reset_session_token).to_not be (session_token1)
    end
  end
end
