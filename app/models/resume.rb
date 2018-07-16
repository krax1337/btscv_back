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

class Resume < ApplicationRecord
	belongs_to :user
	has_many :skills
	has_many :experinces
	has_many :educations
	validates :firstname, :lastname, presence: true
end
