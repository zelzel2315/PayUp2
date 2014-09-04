class BetsController < ApplicationController
	def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user1 = current_user
    @bet.user2 = current_selected_user

    # @bet.save unless @current_selected_user.
      # bet = Bet.new
      # bet.save

        #creates a new user_match object belonging to the first of the two users who are being matched
        # need to create if logged in = current_user
        user1 = UserBet.new
        user1.user_id = current_user.id 
        user1.bet_id = bet.id
        user1.save

        #creates a new user_match object belonging to the second of the two users who are being matched
        user2 = UserBet.new
        user2.user_id = @current_selected_user.id
        user2.bet_id = bet.id
        user2.save

      end

      redirect_to :back

    else
      redirect_to :back
    end
  end

private

  def bet_params
    params.require(:bet).permit(:user1.id, :user2.id) 
  end

  def user_bet_params
    params.require(:user_bet).permit(:user_id, :bet_id)
  end
end
