module Api
    module V1
      class RegistrationController < ApiController

        def create
            @registration=Registration.new
            @registration.event_id=params[:event_id]
            @registration.user_id=params[:user_id]
            @registration.save
        end
        def show
            query1=params[:event_id]
            query2=params[:user_id]
            reg=Registration.where("event_id = ?", query1).where("user_id = ?", query2)
            render json: reg
        end
      end
    end
end