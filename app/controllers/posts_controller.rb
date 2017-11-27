class PostsController < ApplicationController

	def index
		@posts = Post.all
		  .order(created_at: :desc)
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		
	end

	def create
		@post = Post.new(content: params[:content])
		@post.save
    redirect_to "/posts/index"
  end

  def edit
  	@post = Post.find(params[:id])
  end

  ddef update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      redirect_to("/posts/index")
    else
      render 'edit'
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to '/posts/index'
  end
end
