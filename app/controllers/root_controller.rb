class RootController < ApplicationController

    def index
        @posts=Post.all
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
        @post=Post.new
        @post.title=params[:title]
        @post.description=params[:description]
        @post.save
        # @response={     
        #     :status => 200,
        #     :message => "Saved Successfully"
        # }
        # render json: @response
        @posts=Post.all
        redirect_to('/')
        
    end

    def delete
        @post=Post.find(params[:id])
        @post.destroy
        @posts=Post.all
        redirect_to('/')
        # render JSON: params
    end

    def search
        @query=params[:query]
        @posts=Post.where("posts.title LIKE ?",["%#{@query}%"])
        render "index"
    end

    def update
        @post=Post.find(params[:id])
        @id=@post.id
        @title=@post.title
        @description=@post.description
        render "update"
    end

    def updateform
        # render JSON:params
        @post=Post.find(params[:id])
        @post.title=params[:title]
        @post.description=params[:description]
        @post.save
        @posts=Post.all
        redirect_to('/')
    end

    def add_event
        render "add_event"
    end

end
