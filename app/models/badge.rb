class Badge < ApplicationRecord
    belongs_to :profile
    has_many :courses
end
