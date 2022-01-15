class Role < ActiveRecord::Base
	validates_presence_of :name
	has_many :user_roles
	has_many :users, :through => :user_roles
	scope :active_roles, -> { where(is_hidden: false) }
end
