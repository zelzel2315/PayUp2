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
    # @user_bet1 = current_user
    # @user_bet2 = current_selected_user

    # @bet.save unless @current_selected_user.
      # bet = Bet.new
      # bet.save

        #creates a new user_match object belonging to the first of the two users who are being matched
        # need to create if logged in = current_user
        user_bet1 = UserBet.new
        user_bet1.user_id = current_user.id 
        user_bet1.bet_id = bet.id
        user_bet1.save

        #creates a new user_match object belonging to the second of the two users who are being matched
        user_bet2 = UserBet.new
        user_bet2.user_id = @collection_select_user.id
        user_bet2.bet_id = bet.id
        user_bet2.save
    end

    if @bet.save
      render json: @bet, status: :created

    else
      render json: @bet.errors, status: :unprocessed_entity
    end
    
  end

private

  def bet_params
    params.require(:bet).permit(:user_bet1.id, :user_bet2.id) 
  end

  def user_bet_params
    params.require(:user_bet).permit(:user_id, :bet_id)
  end
end
