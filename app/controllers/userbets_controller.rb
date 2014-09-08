class UserbetsController < ApplicationController

  def new
    @userbet = UserBet.new
  end
 
  def create
    @userbet = UserBet.new(params.require(:userbet).permit(:user_id, :bet_id))
    @userbet.user = current_user
  end

  def destroy
    @userbet = UserBet.where(params[:id]).first
    @userbet.destroy
    redirect_to users_path
  end

  private
  def userbet_params
    params.require(:userbet).permit(:user_id, :bet_id)
  end
  
  def get_user
    @user = current_user
    @user = User.where(:id => params[:user_id]).first
  end
end	 
