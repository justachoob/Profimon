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

  end
end
