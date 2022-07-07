module Api
    module V1
      class ApiController < ActionController::Base
        include JsonWebToken

        before_action :authenticate_request
        protect_from_forgery with: :null_session

        private
          def authenticate_request
            header=request.headers["Authorization"]
            header=header.split(" ").last if header
            decoded=jwt_decode(header)
            @current_user=Client.find(decoded[:user_id])
          end
      end
    end
end