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
    @user = User.new(name: params[:name], email: params[:email], image_name: "default_user.jpg")
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.image_name = "#{@user.id}.jpg"
    
    if params[:image]
      image = params[:image]
      File.binwrite("public/assets/img/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to "/users/#{@user.id}"
    else
      render 'edit'
    end
  end

  def login_form
    
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to "/posts/index"
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render 'login_form'
    end
  end
end
