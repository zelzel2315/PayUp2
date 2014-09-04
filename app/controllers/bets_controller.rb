class BetsController < ApplicationController

	respond_to :json
  #respond back with json when performing crud function

  def index
    @bets = Bet.all
    respond_with @bets, each_serializer: BetSerializer
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    @bet.user1 = current_user
    @bet.user2 = current_selected_user

        user1 = UserBet.new
        user1.user_id = current_user.id 
        user1.bet_id = bet.id
        user1.save

        
        user2 = UserBet.new
        user2.user_id = @current_selected_user.id
        user2.bet_id = bet.id
        user2.save
    end

    if @bet.save
      render json: @bet, status: :created

    else
      render json: @bet.errors, status: :unprocessed_entity
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
