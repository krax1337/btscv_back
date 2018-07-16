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

require 'rails_helper'

RSpec.describe Resume, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
