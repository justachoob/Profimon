class ClassBattlesController < ApplicationController
  def load
    @current_profile = Profile.find(params[:current_profile_id])
    @subject = params['subject']
    @course_number = params['course_number']

    require 'open-uri'
    require 'json'

    @course_url = "http://www.sfu.ca/bin/wcm/course-outlines?2016/fall/" + @subject.to_s + "/" + @course_number.to_s
    class_sections = JSON.parse(open(@course_url).read)

    # Enroll in the first section of the class
    @course_info_url = @course_url + "/" + class_sections[0]['text']
    class_info = JSON.parse(open(@course_info_url).read)

    @instructor_name = class_info['instructor'][0]['name']
    @room_number = "Online"
    if class_info['courseSchedule'][0]['buildingCode'] != nil
      @room_number = class_info['courseSchedule'][0]['buildingCode'] + " " + class_info['courseSchedule'][0]['roomNumber']
    end
  end
end
