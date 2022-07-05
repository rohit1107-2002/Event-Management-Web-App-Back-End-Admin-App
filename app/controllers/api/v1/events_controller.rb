module Api
    module V1
      class EventsController < ApiController

        
        def index
          # events_dis=Event.all
          # render json: events_dis

          query1=params[:event_category]
          query2=params[:event_sub_category]
          query3=params[:tag_list]
          # events_dis=Event.where("events.event_type LIKE ?",["%#{query1}%"]).where("events.tag LIKE ?",["%#{query3}%"])
          # render json: events_dis
          
          if query1!='All_Events'
            if query2=='Archived'
              events_dis=Event.where("events.event_type LIKE ?",["%#{query1}%"]).where("events.reg_et < ?",Time.now).where("events.tag LIKE ?",["%#{query3}%"])
              render json: events_dis
            else 
              events_dis=Event.where("events.event_type LIKE ?",["%#{query1}%"]).where("events.reg_et >= ?",Time.now).where("events.tag LIKE ?",["%#{query3}%"])
              render json: events_dis
            end 
          else
              if query2=='Archived'
                events_dis=Event.where("events.reg_et < ?",Time.now).where("events.tag LIKE ?",["%#{query3}%"])
                render json: events_dis
              else 
                events_dis=Event.where("events.reg_et >= ?",Time.now).where("events.tag LIKE ?",["%#{query3}%"])
                render json: events_dis
              end 
          end
        end
        
      end
    end
end