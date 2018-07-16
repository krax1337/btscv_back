# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  resume_id   :integer
#  skill       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :skill do
    resume_id 1
    skill "MyString"
    description "MyText"
  end
end
