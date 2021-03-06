require 'bcrypt'

class UsernameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[\w_]*\z/
      record.errors[attribute] << (options[:message] || "is not a valid username")
    end
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[\w\.]+@{1}\w+(\.+[a-z]{2,4})?(\.[a-z]{2,4})\z/      
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base

  include BCrypt

  has_and_belongs_to_many :clubs
  has_many :posts
  has_many :comments

  validates :username, length: {in: 5..20}, uniqueness: {case_sensitive: false}, username: true
  validates  :email, confirmation: true 
  validates :password, confirmation: true
  validates :password_confirmation, length: {in: 6..30}
  validates :email_confirmation, email: true
   

#regexp = /^[\w_]*$/ #for username
#regexp = /\A[\w\.]+@{1}\w+(\.+[a-z]{2,4})?(\.[a-z]{2,4})$/ for email

  def hashing
    salt = SecureRandom.base64
  end
 
  def password_hashing(password)
    password_hashing = BCrypt::Password.create(salt + password)
  end

  def self.find_by(username) 
    TmpUser.find(:all, :conditions => ["username = lower(?)", username])
  end

 
end
