class ResumesController < ApplicationController
    before_action :authorize_access_request!
    before_action :set_resume, only: [:show, :update, :delete]

    # POST /resumes
    def create
        @resume = Resume.new(resume_params)
        if @resume.save
            render json: @resume
        else
            render json: { errors: @resume.errors.full_messages }, status: :errors
      end
    end
    
    # GET /resumes
    def index
        render json: findUser.resumes
    end
    
    # GET /resumes/1
    def show
      user = findUser
      resume = user.resumes.where(id: params[:resume_id])
      if resume
		render json: resume
      else
        render json: { errors: @resume.errors.full_messages }, status: :errors
      end
    end
  
    # DELETE /resumes/1
    def delete
        @resume.destroy
    end
    
    # PATCH/PUT /resumes/1
    def update
      @resume = Resume.find(params[:resume_id])
      if @resume.update_attributes(resume_params)
        render json: @resume
      else
        render json: { errors: @resume.errors.full_messages }, status: :errors
      end
    end
  
    private
    def findUser
        user = User.find(params[:id])
    end
    def set_resume
        @resume = current_user.resume.find(params[:id])
      end

    def resume_params
        params.permit(current_user, :firstname, :lastname, :address, :phone, :website)
    end
  end
  