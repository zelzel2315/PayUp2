class UserbetsController < ApplicationController
  def new
    @user_bet = UserBet.new
  end

  def create
    @user_bet = UserBet.new(params.require(:user_bet).permit(:user_id, :bet_id))
  end

  def destroy
    @user_bet = UserBet.where(params[:id])
    @user_bet.destroy
    redirect_to users_path
  end
end	 
#         #creates a new user_match object belonging to the first of the two users who are being matched
#         # need to create if logged in = current_user
#         user_bet_1 = UserBet.new
#         user_bet_1.user_id = current_user.id 
#         user_bet_1.bet_id = bet.id
#         user_bet_1.save

#         #creates a new user_match object belonging to the second of the two users who are being matched
#         user_bet_2 = UserBet.new
#         user_bet_2.user_id = @current_likee.id
#         user_bet_2.bet_id = bet.id
#         user_bet_2.save
# end
