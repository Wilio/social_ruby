
require 'bcrypt'

class TmpUser < ActiveRecord::Base

  include BCrypt
  self.primary_key = :username

  def username_validation(username)
  
    regexp = /^[\w[^\W]]*$/ #basically we only accept letters, numbers and undersscore
    if regexp.match(username).nil?
       username_validation = true
    else
       username_validation = true
    end
  end

  def email_validation(email)
    
    regexp = /[A-Za-z0-9_\.]@{1}\w+(\.+[a-z]{2,4})?(\.[a-z]{2,4})$/
    if regexp.match(email).nil?
      email_validation = false
    else
      email_validation = true
    end    
  end

  def salt_maker
    salt = SecureRandom.base64
  end
 
  def auth_maker
    auth_key = SecureRandom.base64
  end

  def password_hashing(password)
    password_hashing = BCrypt::Password.create(salt + password)
  end

  def self.find_by(username) 
    TmpUser.find(:all, :conditions => ["username = lower(?)", username])
  end 

end
