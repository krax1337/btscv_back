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

require 'rails_helper'

RSpec.describe Skill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
