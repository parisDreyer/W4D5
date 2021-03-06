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

FactoryBot.define do
  factory :user do
    username { Faker::HeyArnold.character }
    password 'abcdef'
  end
end