class StakeholdersController < ApplicationController
    before_action :set_stakeholder, only: %i[ show update destroy ]
    skip_before_action :verify_authenticity_token

    def index
        @stakeholders = stakeholder.all
        render json: @stakeholders
    end

    def create
        @stakeholder = Stakeholder.new(stakeholder_params)
        if @stakeholder.save
            render json: @stakeholder
        else
            render json: {error: "unprocessable entry"}
        end
    end

    def show
        render json :@stakeholder
    end

    def update
        if @stakeholder.update(stakeholder_params)
            render json :@stakeholder
        else
            render json: {error: "stakeholder information could not updated "}
        end
    end

    def destroy
        @stakeholder.destroy
    end

    private
    def stakeholder_params
        params.require(:stakeholder).permit(:name ,:email)
    end

    def set_stakeholder
        begin
            @stakeholder = stakeholder.find(params[:id])
          rescue => e
            logger.info e
            return render json: { message: 'stakeholder not found' }, status: :not_found
          end
          render json: @stakeholder
    end
end
