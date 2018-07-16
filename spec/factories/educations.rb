# == Schema Information
#
# Table name: educations
#
#  id             :integer          not null, primary key
#  resume_id      :integer
#  institute_name :string
#  degree         :string
#  start_date     :datetime
#  end_date       :datetime
#  gpa            :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :education do
    resume_id 1
    institute_name "MyString"
    degree "MyString"
    start_date "2018-07-16 00:43:20"
    end_date "2018-07-16 00:43:20"
    gpa 1.5
  end
end
