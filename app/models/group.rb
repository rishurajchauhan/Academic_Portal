class Group < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :memberships
  has_many :users, :through => :memberships
end
