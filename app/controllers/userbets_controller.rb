class UserbetsController < ApplicationController

  def new
    @user_bet = UserBet.new
  end

  def create
    @user_bet = UserBet.new(user_bet_params)
    @user_bet.user = current_user
  end

  def destroy
    @user_bet = UserBet.where(params[:id])
    @user_bet.destroy
    redirect_to users_path
  end

  private
  def user_bet_params
    params.require(:user_bet).permit(:user_id, :bet_id)
  end
  
  def get_user
    @user = current_user
    @user = User.where(:id => params[:user_id]).first
  end
end	 
