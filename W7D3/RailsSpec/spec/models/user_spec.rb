# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations' do 
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
    
    before(:each) do
      create(:user)
    end
    
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
  end

  describe '#is_password?' do
    let!(:user){create(:user)}

    context 'with a valid password' do
      it 'should return true' do
        expect(user.is_password?('password')).to be true
      end
    end

    context 'with an invalid password' do
      it 'should return false' do
        expect(user.is_password?('notpassword')).to be false
      end
    end
  end

  describe 'password hashing' do
    it 'does not save passwords to the database.' do
      create(:harry_potter)
      user = User.find_by(username: 'Harry Potter')
      expect(user.password).not_to eq('password')
    end

    it 'hashes password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')
      FactoryBot.build(:user, password:'abcdef')
    end
  end

  describe '::find_by_credentials' do
    context 'with a valid username and password' do
      it 'searches for a user by username' do 
        jon = User.create(username: "Jon", password: "password")
        user = User.find_by_credentials("Jon", "password")

        expect(user.username).to eq(jon.username)
        expect(user.password_digest).to eq(jon.password_digest)
      end
    end

    context 'with an invalid password' do
      it 'should return nil' do
        jon = User.create(username: "Jon", password: "password")
        user = User.find_by_credentials("Jon", "password1")

        expect(user).to be_nil
      end
    end

    context 'with an invalid username' do
      it 'should return nil' do
        jon = User.create(username: "Jon", password: "password")
        user = User.find_by_credentials("Jon1", "password")

        expect(user).to be_nil
      end
    end
  end

  describe '#reset_session_token!' do
    it 'should reset a user''s session token' do
      jon = User.create(username: "Jon", password: "password")

      expect(jon.session_token).to_not eq(jon.reset_session_token!)
    end
  end

  describe '#ensure_session_token' do
    it 'assigns session token after a user is inialized' do
      jon = User.create(username: "Jon", password: "password")

      expect(jon.session_token).to_not be_nil
    end
  end
end
