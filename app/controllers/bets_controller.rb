class BetsController < ApplicationController

	respond_to :json
  #respond back with json when performing crud function

  def settle
    

    if params["code"]
      auth_code = params["code"]
    end 
    url = "https://api.venmo.com/v1/oauth/access_token"
    @response = HTTParty.post(url, :query => {:client_id => '1916', :client_secret => 'eGcyNHaysfbFGZ6xkMffUw3gGrKFzksG', :code => auth_code})
    user = @response["user"]
    @access_token = @response["access_token"]
    @refresh_token = @response["refresh_token"]
    @email = params[:email]
    @amount = params[:amount]
   
    url = "https://api.venmo.com/v1/payments"
    @amount = HTTParty.post(url, :query => { "access_token" => @access_token, :email => @email, :amount => @amount, :note => 'PayUp'})
    redirect_to bets_path
  end
  def index
    @bets = Bet.all
   
  end
  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
    # @user= User.find(params[:id])
    @user = @current_user_id
   
     
    
  end

  def create
    @user = @current_user_id
    @bet = Bet.new(params.require(:bet).permit(:challenge,
      :amount,
      :challenger,
      :challengee, :challenge_start, :challenge_end, :venmo_id) )
    if @bet.save
      # render json: @bet, status: :created
      redirect_to bets_path
    end
    
  end

  def destroy
    @bet = Bet.where(params[:id]).first
    @bet.destroy
    redirect_to users_path
  end

 end
