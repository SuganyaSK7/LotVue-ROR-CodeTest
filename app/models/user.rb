class User < ActiveRecord::Base
	has_many :user_roles
	has_many :roles, :through => :user_roles
	validates_presence_of :first_name,:last_name,:email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :first_name
end
