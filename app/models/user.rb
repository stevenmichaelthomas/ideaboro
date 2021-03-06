require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation
	has_many :microposts, :dependent => :destroy
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, :presence => true,
			  :length   => { :maximum => 50 }
	validates :email, :presence => true,
		      :format   => { :with => email_regex },
			  :uniqueness => { :case_sensitive => false} 
	validates :password, :presence => true,
			  :confirmation => true,
			  :length => { :within => 5..40 }
			  
	before_save :encrypt_password

    def has_password?(submitted_password)
	 encrypted_password == encrypt(submitted_password)
	end
	def feed
	  Micropost.where("user_id = ?", id)
	end
	
	def self.authenticate(email, submitted_password)
     user = find_by_email(email) #implied User.find_by_email because self definition is inside User class
     return nil  if user.nil? #returns nil if user can't be found
     return user if user.has_password?(submitted_password) #returns user if password match, skips to end of sequence (returns nil) if password mismatch
    end
	
	def self.authenticate_with_salt(id, cookie_salt)
     user = find_by_id(id)
     (user && user.salt == cookie_salt) ? user : nil
    end
	
	private

    def secure_hash(string)
	  Digest::SHA2.hexdigest(string)
	end
	
	def make_salt
	  secure_hash("#{Time.now.utc}--#{password}")
	end
	
	def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
	
	def encrypt_password
	  self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
		
end

