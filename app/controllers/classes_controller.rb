class ClassesController < ApplicationController

  before_action :confirm_logged_in
  before_action :confirm_own_classes_page, only: [:select]
  before_action :confirm_enrollment, only: [:enroll]
  

  def select
    @current_profile = Profile.find(params[:profile])

    require 'open-uri'
    require 'json'

    @subjects = []
    subjects_raw = JSON.parse(open("https://www.sfu.ca/bin/wcm/course-outlines?2016/fall").read)

    subjects_raw.each do |s|
      @subjects << s["text"]
    end
  end

  def enroll
    @subject = params['subject']['subject_id']
    @course_number = params['course_number']
    @current_profile_id = params['profile']['id']
    if @subject != ""
      redirect_to(controller: 'class_battles', action: 'load', current_profile_id: @current_profile_id, subject: @subject, course_number: @course_number)
    end
  end

  def new
    @courses_taken = CourseTaken.new

  end





end
