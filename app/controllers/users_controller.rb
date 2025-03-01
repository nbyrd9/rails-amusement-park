class UsersController < ApplicationController
    def welcome
    end
  
    def signin
    end
  
    def login
      user = User.find_by(name: params[:user][:name])
      if user
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to signin_path
      end
    end
  
    def logout
      session.delete(:user_id)
      redirect_to root_path
    end
  
    def new
      @user = User.new
    end
  
    def show
      return redirect_to root_path unless logged_in?
      @user = User.find_by(id: params[:id])
    end
  
    def create
      User.create(user_params)
      session[:user_id] = User.last.id
      redirect_to user_path(current_user)
    end
  
    def update
      user = User.find(params[:id])
      user.update(user_params)
      redirect_to user_path(user)
    end
  
    def edit
      @user = User.find_by(id: params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation,
                                  :height, :happiness, :nausea, :tickets, :admin)
    end
  
end
