class TeamMembersController < ApplicationController
    before_action :set_team_member, only: %i[ show update destroy ]
    skip_before_action :verify_authenticity_token

    def index
        @team_members = TeamMember.all
        render json: @team_members
    end

    def create
        @team_member = TeamMember.new(team_member_params)
        if @team_member.save
            render json: @team_member
        else
            render json: {error: "unprocessable entry"}
        end
    end

    def show
        render json :@team_member
    end

    def update
        if @team_member.update(team_member_params)
            render json :@team_member
        else
            render json: {error: "team_member information could not updated "}
        end
    end

    def destroy
        @team_member.destroy
    end

    private
    def team_member_params
        params.require(:team_member).permit(:name ,:email)
    end

    def set_team_member
        begin
            @team_member = team_member.find(params[:id])
          rescue => e
            logger.info e
            return render json: { message: 'team_member not found' }, status: :not_found
          end
          render json: @team_member
    end
end
