class Student < ApplicationRecord

  # Student belongs to the teacher
  belongs_to :user, optional: true, foreign_key: "id"

  # Ensure password
  has_secure_password

  # Ensure no username is used twice
  validates_uniqueness_of :username

  # Students can have many messages
  has_many :messages

  # Makes username lowercase before save to keep login errors based on case sensitivity from occuring #
  before_validation :lowercase_username

  def lowercase_username
    self.username = self.username.downcase
  end

end
