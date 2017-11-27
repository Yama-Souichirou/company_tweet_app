class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		
	end

	def create
    redirect_to "/posts/index"
  end
end
