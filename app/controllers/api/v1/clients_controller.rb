module Api
    module V1
        class ClientsController < ApiController

            skip_before_action :authenticate_request, only: [:create]
            before_action :set_user, only: [:show, :destroy]

            # GET /clients
            def index
                @clients=Client.all
                render json: @clients ,status: :ok
            end

            # GET /clients/{username}
            def show
                render json: @client ,status: :ok
            end
            
            # POST /clients
            def create
                @client=Client.new(client_params)
                if @client.save
                    render json: @client, status: :created
                else
                    render json: {errors: @client.errors.full_messages} ,status: :unprocessable_entity
                end
            end
            
            # PUT /clients/{username}
            def update
                unless @client.update(client_params)
                    render json: {errors: @client.errors.full_messages} ,status: :unprocessable_entity
                end
            end

            # DELETE /clients/{username}
            def destroy
                @client.destroy
            end

            private 
                def client_params
                    params.permit(:username,:email,:password)
                end

                def set_user
                    @client=Client.find(params[:id])
                end
            

        end
    end
end