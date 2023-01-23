class ProjectsController < ApplicationController
    before_action :set_project, only: %i[ show update destroy ]
    skip_before_action :verify_authenticity_token

    def index
        @projects = Project.all
        render json: @projects
    end

    def show
        render json: @project
    end

    def create
        @project = Project.new(project_params)
        if @project.save!
            render json: @project , status: :created
        else
            render json: {error: "Project not created"} , status: :not_created
        end
    end

    def update
       if @project.update(project_params)
        render json: @project , status: :updated
       else
        render json: {error: "Project information not updated"} , status: :not_updated
       end 
    end

    def destroy
        @project.destroy
        render json: {message: "Project deleted successfully"} , status: :deleted
    end

    private

    def project_params
        params.require(:project).permit(
            :project_name , 
            :start_date , 
            :end_date,
            :status, 
            :phase, 
            :category,
            :manager_id
            )
    end

    def set_project
        begin
            @project = Project.find(params[:id])
          rescue => e
            logger.info e
            return render json: { message: 'project not found' }, status: :not_found
          end
          render json: @project
    end
end
