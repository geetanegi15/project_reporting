class ProjectMembersController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    before_action :set_member, only: %i[ show update destroy ]
    before_action :set_project, only: %i[ create update ]


    def index
        @members = ProjectMember.all
        render json: @members
    end

    def show
        render json: @member
    end

    def create
        @member = @project.project_members.create(member_params)
        if @member.save!
            render json: @member 
        else
            render json: {error: "unprocessable entry"}
        end
    end

    def update
        if @member.update(member_params)
            render json: @member
        else
            render json: {error: "member information not updated"}
        end
    end

    def destroy
        @member.destroy
    end

    private

    def member_params
        params.require(:project_member).permit(:name, :email, :role)
    end

    def set_member
        begin
            @member = ProjectMember.find(params[:id])
          rescue => e
            logger.info e
            return render json: { message: 'this member is not belong to this project' }, status: :not_found
          end
          render json: @member
    end
    def set_project
        @project = Project.find(params[:project_id])
    end
end
