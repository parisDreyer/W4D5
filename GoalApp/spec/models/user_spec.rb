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
    let (:incomplete_user) { User.new( password: 'starwars' ) }
    it 'validates presence and username' do
      expect(incomplete_user).not_to be_valid
  
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }
      it { should validate_length_of(:password).is_at_least(6) }
        

  end
end
