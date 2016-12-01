class Course < ApplicationRecord
	belongs_to :profile
	belongs_to :badge
	
end
