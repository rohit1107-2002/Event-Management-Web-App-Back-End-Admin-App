module Api
    module V1
        class AuthenticationController < ApiController
            skip_before_action :authenticate_request

            #POST /auth/login
            def login
                @client=Client.find_by_email(params[:email])
                if @client&.authenticate(params[:password])
                    token=jwt_encode(user_id: @client.id)
                    render json: {token: token}, status: :ok
                else
                    render json: {error: 'unauthorized'}, status: :unauthorized
                end
            end

        end
    end
end