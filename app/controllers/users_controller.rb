class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email])
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def edit
    @user = User.find(params[:id])
  end
end
