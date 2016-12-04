class ClassBattlesController < ApplicationController
  before_action :confirm_logged_in
  before_action :confirm_battle

  def load
    @course = Course.new
    @current_profile = Profile.find(params[:current_profile_id])
    @subject = params['subject']
    @course_number = params['course_number']

    require 'open-uri'
    require 'json'

    @course_url = "https://www.sfu.ca/bin/wcm/course-outlines?2016/fall/" + @subject.to_s + "/" + @course_number.to_s
    class_sections = JSON.parse(open(@course_url).read)

    # Enroll in the first section of the class
    @course_info_url = @course_url + "/" + class_sections[0]['text']
    class_info = JSON.parse(open(@course_info_url).read)

    @instructor_name = class_info['instructor'][0]['name']
    @room_number = "Online"
    if class_info['courseSchedule'][0]['buildingCode'] != nil
      @room_number = class_info['courseSchedule'][0]['buildingCode'] + " " + class_info['courseSchedule'][0]['roomNumber']
    end

    @profimon_skills = ProfimonSkill.where(subject: [@subject, "All"])
    @user_skills = Skill.where(subject: [@subject, "All"])
    @user_skills = @user_skills.where("gpa_required <= ?", @current_profile.current_gpa)

    # Pick 3 random skills for the user
    @randseed = Random.new
    rand_index = @randseed.rand(@user_skills.count)
    @user_skill1 = @user_skills[rand_index]

    begin
      rand_index = @randseed.rand(@user_skills.count)
      @user_skill2 = @user_skills[rand_index]
    end while (@user_skill2 == @user_skill1)

    begin
      rand_index = @randseed.rand(@user_skills.count)
      @user_skill3 = @user_skills[rand_index]
    end while (@user_skill3 == @user_skill1 || @user_skill3 == @user_skill2)

    @profimon_rand_array = 10.times.map{@randseed.rand(@profimon_skills.count)}
    @prof_skill1 = @profimon_skills[@profimon_rand_array[1]]
    @prof_skill2 = @profimon_skills[@profimon_rand_array[2]]
    @prof_skill3 = @profimon_skills[@profimon_rand_array[3]]
    @prof_skill4 = @profimon_skills[@profimon_rand_array[4]]
    @prof_skill5 = @profimon_skills[@profimon_rand_array[5]]
    @prof_skill6 = @profimon_skills[@profimon_rand_array[6]]
    @prof_skill7 = @profimon_skills[@profimon_rand_array[7]]
    @prof_skill8 = @profimon_skills[@profimon_rand_array[8]]
    @prof_skill9 = @profimon_skills[@profimon_rand_array[9]]
    @prof_skill0 = @profimon_skills[@profimon_rand_array[0]]

    @difficulty_url = "https://spreadsheets.google.com/feeds/cells/1EmwODxz1VFG9hhjUb6a7e-RhKW28R3LoQYvFyr27uW0/1/public/values?alt=json-in-script"
    @course_subject_number = @subject + " " + @course_number
    @course_subject_number = @course_subject_number.upcase
    @difficulties = open(@difficulty_url).read
    @difficulties = @difficulties[@difficulties.index('{')..-3]
    @difficulties = JSON.parse(@difficulties)
    @course_difficulty = 2
    for i in 2..@difficulties["feed"]["entry"].count-1
      if @course_subject_number == @difficulties["feed"]["entry"][i]["gs$cell"]["$t"]
        @course_difficulty = @difficulties["feed"]["entry"][i+1]["gs$cell"]["$t"]
      end
    end
  end
end
