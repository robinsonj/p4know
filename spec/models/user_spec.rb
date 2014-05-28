require 'spec_helper'

describe User do
  describe 'New Users' do
    it 'creates new users with valid params' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'does not create duplicate users (name)' do
      user1 = create(:user)
      user2 = build(:user, name: user1.name)
      expect(user1).to be_valid
      expect(user2).not_to be_valid
    end
  end
end
