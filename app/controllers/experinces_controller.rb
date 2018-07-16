class ExperincesController < ApplicationController
    before_action :authorize_access_request!
    before_action :set_experince, only: [:show, :update, :delete]


    def create
        @experince = Experince.new(experince_params)

    end
    
    def show
      experince = user.resumes.experince.where(id: params[:resume_id])
      if resume
        render json: @experince
      else
        render json: { errors: @experince.errors.full_messages }, status: :errors
      end
    end
  
    def delete
        @experince.destroy
    end
  
    def update
      @experince = Experince.find(params[:id])
      if @experince.update_attributes(experince_params)
        render json: @experince
      else
        render json: { errors: @experince.errors.full_messages }, status: :errors
      end
    end
  
    private
    def set_experince
        @experince = current_user.resume.experince.find(params[:id])
    end

    def experince_params
        params.permit(:resume_id, :company_name , :designation , 
        :job_description, :start_date, :end_date, :current)
    end
  end
  