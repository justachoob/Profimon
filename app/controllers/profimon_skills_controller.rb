class ProfimonSkillsController < ApplicationController
	before_action :set_profimon_skill, only: [:edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :confirm_admin

  def new
  	@profimon_skill = ProfimonSkill.new
    subject_collection

  end

  def create
  	@profimon_skill = ProfimonSkill.new(profimon_skill_params)
  	if @profimon_skill.save
  		flash[:notice] = "Profimon skill created successfully"
  		redirect_to profimon_skills_path
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
      if @profimon_skill.update(profimon_skill_params)
        format.html { redirect_to profimon_skills_path, notice: 'Profimon Skill was successfully updated.' }
        format.json { render :index, status: :ok, location: @profimon_skill}
      else
        format.html { redirect_to edit_profimon_skill_path, notice: "Please enter valid values." }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  def index
  	@profimon_skills = ProfimonSkill.all
  end

  def destroy
    @profimon_skill.destroy
    redirect_to profimon_skills_path
  end

  private

  def set_profimon_skill
    @profimon_skill = ProfimonSkill.find(params[:id])
  end

  def profimon_skill_params
    params.require(:profimon_skill).permit(:id, :name, :subject, :stamina, :knowledge, :homework)
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
