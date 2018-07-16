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

class Education < ApplicationRecord
    belongs_to :resume
    validates :institute_name, :degree, :start_date, presence: true
end
