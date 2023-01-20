class ClientInformationsController < ApplicationController
    before_action :set_client, only: %i[ show update destroy ]
    skip_before_action :verify_authenticity_token
    
    def index
        @clients = ClientInformation.all
        render json: @clients
    end

    def show
        render json: @client
    end

    def create
        @client = ClientInformation.new(client_params)
        if @client.save!
            render json: @client , status: :created
        else
            render json: {error: "unprocessable entry"}  , status: :not_create
        end 
    end

    def update
        if @client.update(client_params)
            render json: @client , status: :updated
        else
            render json: {error: "client information could not updated"} , status: :not_updated
        end
    end

    def destroy
        @client.destroy
        render json: {message: "client information deleted "}
    end

    private

    def client_params
        params.require(:client_information).permit(:full_name, :company, :url, :email, :phone_number)
    end

    def set_client
        begin
            @client = ClientInformation.find(params[:id])
          rescue => e
            logger.info e
            return render json: { message: 'client not found' }, status: :not_found
          end
          render json: @client
        end
end
