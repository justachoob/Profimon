class ProfimonSkill < ApplicationRecord
	validates :name, :presence=>true
	validates :stamina, numericality: { only_integer: true, less_than_or_equal_to: 100, greater_than_or_equal_to: -100 }
	validates :knowledge, numericality: { only_integer: true, less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
	validates :homework, numericality: { only_integer: true, less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }
end
