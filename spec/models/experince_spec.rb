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

require 'rails_helper'

RSpec.describe Experince, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
