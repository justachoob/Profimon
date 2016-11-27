class Profile < ApplicationRecord
	belongs_to :user
	after_initialize :default_values
  has_many :courses
  has_many :badges

    def default_values
      self.current_gpa  ||= 4.0
      self.num_of_courses_taken ||= 0

    end

  validates :pname, :presence=>true
  validates :faculty, :presence=>true
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/defaultAvatar/default.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
