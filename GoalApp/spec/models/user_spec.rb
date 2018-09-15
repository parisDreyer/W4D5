# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # username: 'harry_potter',
    
    # it 'validates presence and username' do
    #   expect(incomplete_user).not_to be_valid
    # end
  
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should have_many(:goals) }
    # it 'finds a user by credentials' do
    #     User.find_by_credentials
    # 
    # end 
    
    describe 'session_token' do
      it 'assisgn session_token if there is no session token' do
        expect(FactoryBot.build(:user).session_token).not_to be_nil
      end
    end
    
    describe "password encryption" do
      it "does not save passwords to db" do
        # User.create(username: 'harry_potter', email: 'harry@hogwarts.com', age: 25, password: 'abcdef')
        # FactoryBot.create(:user, username: 'harry_potter')
        user = FactoryBot.create(:user)
        user1 = User.find_by(username: user.username)

        expect(user.password).not_to be('abcdef')
      end

      it "encrypts password using BCrypt" do
        expect(BCrypt::Password).to receive(:create).with('abcdef')
        # User.new(username: 'harry_potter', email: 'harry@hogwarts.com', age: 25, password: 'abcdef')
        FactoryBot.build(:user)
      end    
    end
end
