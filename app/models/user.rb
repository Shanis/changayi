class User < ActiveRecord::Base
attr_accessible :name, :email, :password, :password_confirmation
attr_accessor :password
attr_protected :id, :salt
before_save :encrypt_password

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :name, :presence => true,	:length   => {:minimium => 3, :maximum => 50 }
validates :email, :presence => true, :length   => {:minimium => 3, :maximum => 50 }, :format   => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
validates :password, :presence => true, :length   => {:minimium => 3, :maximum => 10 }, :confirmation => true
validates :password_confirmation, :presence => true, :length   => {:minimium => 3, :maximum => 10 }

def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
end
  
def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  
 def self.random_string(len)
   #generate a random password consisting of strings and digits
   chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
   newpass = ""
   1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
   return newpass
 end
 
 def send_new_password
  new_pass = User.random_string(10)
  self.password = self.password_confirmation = new_pass
  self.save
  Notifications.deliver_forgot_password(self.email, new_pass)
end

end
