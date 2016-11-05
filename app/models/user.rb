class User < ApplicationRecord

	has_secure_password
	has_many :profile

 	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i


	validates :name, :presence=>true, :length => { :within => 6..25}, :uniqueness => true

	validates :email, :presence=>true, :format=>EMAIL_REGEX, :length => {:maximum => 100}, :uniqueness => true
	validates :password, :confirmation=>true, :length => {:in => 6..20}
	validates :password_confirmation, :presence =>true
	validates_length_of :password, :in=> 6..20


end
