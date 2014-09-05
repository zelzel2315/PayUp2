class BetsController < ApplicationController

	respond_to :json
  #respond back with json when performing crud function

  def index
    @bets = Bet.all

    
  end

  def new
    @bet = Bet.new
    @user = User.all
    # @user = current_user
  end

  def create
    
    
    @bet = Bet.new(params.require(:bet).permit(:challenge,
      :amount,
      :challenger,
      :challengee) )
    # @user_bet1 = current_user
    # @user_bet2 = current_selected_user

    # @bet.save unless @current_selected_user.
      # bet = Bet.new
      # bet.save
    # @bet = current_user.bets.new(params[:bet])

      # @bet.save
        
      # challenger = @bet.user_bets.new
      # challenger.user = current_user 
      # challenger.save

      # challengee = @bet.user_bets.new
      # challengee.user = 1234
      # challengee.save     

    if @bet.save
      # render json: @bet, status: :created
      redirect_to bets_path

    # else
    #   render json: @bet.errors, status: :unprocessed_entity
    end
    
  end

private

  def bet_params
    
  end

  def user_bet_params
    params.require(:user_bet).permit(:user_id, :bet_id)
  end
end
