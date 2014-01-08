class Profile < ActiveRecord::Base
  attr_accessible :books, :collaborators, :conferences, :current_students, :journals, :monogram, :research, :user_id
  attr_accessible :ph, :cabin, :post, :subjects
  belongs_to :user
 
end
