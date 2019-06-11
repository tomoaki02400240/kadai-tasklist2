class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:password].downcase
    password = params[:session][:password]
    if login(email.password)
      flash[:success] = 'loginしました'
      redirect_to root_url
    else
      flash.now[:danger] = 'login失敗'
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def login
    @user = User.find_by(email: email)
    if @user&&authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end
