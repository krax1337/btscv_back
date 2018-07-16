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

require 'rails_helper'

RSpec.describe Education, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
