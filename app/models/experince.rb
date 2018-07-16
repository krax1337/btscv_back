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

class Experince < ApplicationRecord
    belongs_to :resume
    validates :company_name, :designation, :start_date, presence: true
end
