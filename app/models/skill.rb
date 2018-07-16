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

class Skill < ApplicationRecord
    belongs_to :resume
    validates :skill, presence: true
end
