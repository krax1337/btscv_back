# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  firstname  :string
#  lastname   :string
#  phone      :string
#  address    :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :resume do
    user_id 1
    firstname "MyString"
    lastname "MyString"
    phone "MyString"
    address "MyString"
    website "MyString"
  end
end
