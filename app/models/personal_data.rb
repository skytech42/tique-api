# frozen_string_literal: true

# user personal data
class PersonalData < ApplicationRecord
  validates_presence_of :identifier_type
  validates_presence_of :name
  validates_presence_of :last_name

  validates :identifier_number, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.+]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  before_create :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
