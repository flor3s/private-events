class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Account creation successful!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
    @created_events = @user.created_events
    @attending = @user.attended_events
  end

  private

  	def user_params
  		params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	end
end
