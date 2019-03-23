class User < ApplicationRecord

  # Ensure password
  has_secure_password

  # Ensure no email is used twice
  validates :email, uniqueness: true

  # Items that belong to the user
  has_many :students
  has_many :products
  has_many :messages

# Makes user email lowercase before save to keep login errors based on case sensitivity from occuring #
  before_validation :lowercase_email

  def lowercase_email
    self.email = self.email.downcase
  end

# Sends forgot password email when asked for by user
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.forgot_password(self).deliver
  end
  # This generates a random password reset token for the user
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
