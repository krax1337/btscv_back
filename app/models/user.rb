# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           default(""), not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_secure_password
  has_many :resumes
  

  # enum role: %i[user manager admin].freeze

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  def attributes
    { id: id, email: email}
  end

  def generate_password_token!
    begin
      self.reset_password_token = SecureRandom.urlsafe_base64
    end while User.exists?(reset_password_token: self.reset_password_token)
    self.reset_password_token_expires_at = 1.day.from_now
    save!
  end

  def clear_password_token!
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    save!
  end
end
