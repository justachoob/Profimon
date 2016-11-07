json.extract! profile, :id, :pname, :faculty, :current_gpa, :num_of_courses_taken, :courses_taken, :badges, :created_at, :updated_at
json.url profile_url(profile, format: :json)