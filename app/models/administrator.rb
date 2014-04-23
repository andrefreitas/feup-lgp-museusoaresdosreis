require 'digest/sha1'
class Administrator < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  before_save :encrypt_password
  
  def encrypt_password
    unless self.password.blank?
      self.password = Digest::SHA1.hexdigest(self.password.to_s)
    end
    return true
  end
  
  def self.authenticate(email,password)
    pwd = Digest::SHA1.hexdigest(password.to_s)
    user = Administrator.find_by_email_and_password(email,pwd)
    return user 
  end
end
