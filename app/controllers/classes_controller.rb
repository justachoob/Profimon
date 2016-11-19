class ClassesController < ApplicationController

  before_action :confirm_logged_in

  def select
    @current_profile = Profile.find(params[:profile])

    require 'open-uri'
    require 'json'

    @subjects = []
    subjects_raw = JSON.parse(open("http://www.sfu.ca/bin/wcm/course-outlines?2016/fall").read)

    subjects_raw.each do |s|
      @subjects << s["text"]
    end
  end

  def enroll
    @subject = params['subject']['subject_id']
    @course_number = params['course_number']
    @current_profile_id = params['profile']['id']
    redirect_to(controller: 'class_battles', action: 'load', current_profile_id: @current_profile_id, subject: @subject, course_number: @course_number)
  end

end
