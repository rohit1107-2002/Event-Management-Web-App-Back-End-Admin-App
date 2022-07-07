module Api
    module V1
        class ClientsController < ApiController

            skip_before_action :authenticate_request, only: [:create]
            before_action :set_user, only: [:show, :destroy]

            # GET /clients
            def index
                @users=User.all
                render json: @users ,status: :ok
            end

            # GET /clients/{username}
            def show
                render json: @user ,status: :ok
            end
            
            # POST /clients
            def create
                @user=User.new(client_params)
                if @user.save
                    render json: @user, status: :created
                else
                    render json: {errors: @user.errors.full_messages} ,status: :unprocessable_entity
                end
            end
            
            # PUT /clients/{username}
            def update
                unless @user.update(client_params)
                    render json: {errors: @user.errors.full_messages} ,status: :unprocessable_entity
                end
            end

            # DELETE /clients/{username}
            def destroy
                @user.destroy
            end

            private 
                def client_params
                    # params.permit(:username,:email,:password)
                    params.permit(:email,:password)
                end

                def set_user
                    @user=User.find(params[:id])
                end
            

        end
    end
end