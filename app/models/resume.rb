class Resume < ApplicationRecord
	belongs_to :user
	validates :firstname, :lastname, presence: true
end
