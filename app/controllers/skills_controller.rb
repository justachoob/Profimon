class SkillsController < ApplicationController
  before_action :set_skill, only: [:edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :confirm_admin

  def new
  	@skill = Skill.new
    subject_collection
  	 
  end

  def create
  	@skill = Skill.new(skill_params)
  	if @skill.save
  		flash[:notice] = "Skill created successfully"
  		redirect_to skills_path
  	else
  		flash[:notice] = "Error with creation"
      subject_collection
  		render :new
  	end
  end

  def edit
    subject_collection
  end


  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to skills_path, notice: 'Skill was successfully updated.' }
        format.json { render :index, status: :ok, location: @skill}
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def index
  	@skills = Skill.all
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:id, :name, :subject, :stamina, :gpa_required)
  end

  def subject_collection
    require 'open-uri'
    require 'json'

    @subjects = ["All"]
    subjects_raw = JSON.parse(open("http://www.sfu.ca/bin/wcm/course-outlines?2016/fall").read)

    subjects_raw.each do |s|
      @subjects << s["text"]
    end
  end
end
