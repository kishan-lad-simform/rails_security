class UsersController < ApplicationController
 before_action :require_login, only: [ :index, :logout ]

  def index
    @user = User.find(current_user.id)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: 422
    end
  end

  def check_login; end

  def login
    @user = User.find_by("email = ?", params[:email])
    if @user.present? && @user.authenticate(params[:password])
      reset_session
      session[:user_id] = @user.id
      redirect_to users_path, notice: "Login Success."
    else
      flash[:alert] = "Invalid Login."
      redirect_to login_path
    end 
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You Logout."
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit( :name, :email, :password )  
    end

end
