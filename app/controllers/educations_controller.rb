class EducationsController < ApplicationController
    before_action :authorize_access_request!
    before_action :set_education, only: [:show, :update, :delete]


    def create
        @education = Education.new(education_params)

    end
    
    def show
      education = user.resumes.education.where(id: params[:resume_id])
      if resume
        render json: @education
      else
        render json: { errors: @education.errors.full_messages }, status: :errors
      end
    end
  
    def delete
        @education.destroy
    end
  
    def update
      @education = Education.find(params[:id])
      if @education.update_attributes(education_params)
        render json: @education
      else
        render json: { errors: @education.errors.full_messages }, status: :errors
      end
    end
  
    private
    def set_education
        @education = current_user.resume.education.find(params[:id])
    end

    def education_params
        params.permit(:resume_id, :institute_name, :degree , :start_date, :end_date, :gpa)
    end
  end
  