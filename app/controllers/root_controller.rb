class RootController < ApplicationController

    def index
        # @posts=Post.all
        @events=Event.all
        render "index"
    end

    def about
        # puts "------------------------------------"
        # puts "about in server"
        render "about"
    end

    def contact
        # puts "------------------------------------"
        # puts "contact in server"
        # redirect_to('/about')
        render "contact"
    end

    # def api
    #     @response={      #hash map - key value pair
    #         :status => 200,
    #         :message => "hello world"
    #     }
    #     render json: @response
    # end

    # def user
    #     render json: params
    #     # render json: params[:name]
    # end

    def add
        # render json:params
        # @post=Post.new
        # @post.title=params[:title]
        # @post.description=params[:description]
        # @post.save
        @event=Event.new
        @event.title=params[:title]
        @event.description=params[:description]
        @event.cover_image=params[:cover_image]
        @event.reg_st=params[:reg_st_time]
        @event.reg_et=params[:reg_end_time]
        @event.fees=params[:fees]
        @event.venue=params[:venue]
        @event.event_type=params[:event_type]
        @event.tag=params[:tag]
        @event.save
        # @response={     
        #     :status => 200,
        #     :message => "Saved Successfully"
        # }
        # render json: @response
        @events=Event.all
        redirect_to('/')
        
    end

    def delete
        # @post=Post.find(params[:id])
        # @post.destroy
        # @posts=Post.all
        @event=Event.find(params[:id])
        @event.destroy
        @events=Event.all
        redirect_to('/')
        # render JSON: params
    end

    def search
        @query=params[:query]
        # @posts=Post.where("posts.title LIKE ?",["%#{@query}%"])
        @events=Event.where("events.title LIKE ?",["%#{@query}%"])
        render "index"
    end

    def update
        # @post=Post.find(params[:id])
        # @id=@post.id
        # @title=@post.title
        # @description=@post.description
        @event=Event.find(params[:id])
        @id=@event.id
        @title=@event.title
        @description=@event.description
        @cover_image=@event.cover_image
        @Reg_ST=@event.reg_st
        @Reg_ET=@event.reg_et
        @fees=@event.fees
        @venue=@event.venue
        @event_type=@event.event_type
        @tag=@event.tag
        render "update"
    end

    def updateform
        # render JSON:params
        # @post=Post.find(params[:id])
        # @post.title=params[:title]
        # @post.description=params[:description]
        # @post.save
        # @posts=Post.all
        @event=Event.find(params[:id])
        @event.title=params[:title]
        @event.description=params[:description]
        @event.cover_image=params[:cover_image]
        @event.reg_st=params[:reg_st_time]
        @event.reg_et=params[:reg_end_time]
        @event.fees=params[:fees]
        @event.venue=params[:venue]
        @event.event_type=params[:event_type]
        @event.tag=params[:tag]
        @event.save
        @events=Event.all
        redirect_to('/')
    end

    def add_event
        render "add_event"
    end

end
  