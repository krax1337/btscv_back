class SkillsController < ApplicationController
    before_action :authorize_access_request!
    before_action :set_skill, only: [:show, :update, :delete]


    def create
        @skill = Skill.new(skill_params)
    end
    
    def show
      skill = user.resumes.skill.where(id: params[:resume_id])
      if resume
        render json: @skill
      else
        render json: { errors: @skill.errors.full_messages }, status: :errors
      end
    end
  
    def delete
        @skill.destroy
    end
  
    def update
      @skill = Skill.find(params[:id])
      if @skill.update_attributes(skill_params)
        render json: @skill
      else
        render json: { errors: @skill.errors.full_messages }, status: :errors
      end
    end
  
    private
    def set_skill
        @skill = current_user.resume.skill.find(params[:id])
    end

    def skill_params
        params.permit(:resume_id, :skill, :description)
    end
  end
  