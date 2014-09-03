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
   
    # @current_betee = @like.likee

    # #prevent user from liking someone if they have already rejected them
    # @like.save unless @current_likee.rejectors.include?(current_user)

    # if @like.persisted? 
      
    #   #if the likee of the current like object has already liked the current user
    #   if @current_likee.likees.include?(current_user)
        
    #     # creates a new match object that will belong to both users through UserMatch
      bet = Bet.new
      bet.save

      #creates a new user_match object belonging to the first of the two users who are being matched
      # need to create if logged in = current_user
      user_bet_1 = UserBet.new
      user_bet_1.user_id = current_user.id 
      user_bet_1.bet_id = bet.id
      user_bet_1.save

      #creates a new user_match object belonging to the second of the two users who are being matched
      user_bet_2 = UserBet.new
      user_bet_2.user_id = @current_likee.id
      user_bet_2.bet_id = bet.id
      user_bet_2.save

    end

    if @bet.save
      render json: @bet, status: :created

    else
      render json: @bet.errors, status: :unprocessed_entity
    end
  end

private

  def bet_params
    params.require(:bet).permit(:current_user.id, :current_user_friend.id) 
  end

  def user_bet_params
    params.require(:user_bet).permit(:user_id, :bet_id)
  end
end
