class UsersController < ApplicationController

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

 
  def index
    @users = User.all
  end

  # prepare to show sign-up form but we won't need this
  # def new
  #   @user = User.new
  #   @is_signup = true 
  # end 

  def show
    @user = User.find(params[:id])
  end

  # acutally build user but we won't need this
  # def create
  #   @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
  #   if @user.save
  #     session[:user_id] = @user.id.to_s
  #     redirect_to user_path(@user)
  #   else 
  #     redirect_to new_user_path
  #   end
  # end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    reset_session
    User.find(params[:id]).destroy
    # Exactly the same idea as this little number:
#    User.find_by(id: params[:id])
    redirect_to new_user_path
  end
end