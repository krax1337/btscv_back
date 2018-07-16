# == Schema Information
#
# Table name: experinces
#
#  id              :integer          not null, primary key
#  resume_id       :integer
#  company_name    :string
#  designation     :string
#  job_description :text
#  start_date      :datetime
#  end_date        :datetime
#  current         :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :experince do
    resume_id 1
    company_name "MyString"
    designation "MyString"
    job_description "MyText"
    start_date "2018-07-16 00:41:40"
    end_date "2018-07-16 00:41:40"
    current ""
  end
end
