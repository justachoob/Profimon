class User < ApplicationRecord

	has_secure_password

 	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	#PASS_REGEX = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,25}$/
	PASS_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,25}\Z/i # 6 to 25 characters at least 1 Alphabet and 1 Number:

	validates :name, :presence=>true, :length => { :within => 6..25}, :uniqueness => true

	validates :email, :presence=>true, :format=>EMAIL_REGEX, :length => {:maximum => 100}, :uniqueness => true
	validates :password, :confirmation=>true, :length => {:in => 6..20}, :format=>PASS_REGEX
	validates :password_confirmation, :presence =>true
	validates_length_of :password, :in=> 6..20


end
