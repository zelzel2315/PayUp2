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
    if params["code"]
      auth_code = params["code"]
    end 
    url = "https://api.venmo.com/v1/oauth/access_token"
    @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    user = @response["user"]
    @access_token = @response["access_token"]
    @refresh_token = @response["refresh_token"]
  

    @user = User.new(:username => user["username"], 
      :first_name => user["first_name"], 
      :last_name => user["last_name"], 
      :display_name => user["display_name"], 
      :is_friend => user["is_friend"], 
      :friends_count => user["friends_count"], 
      :about => @response["access_token"], 
      :email => user["email"], 
      :phone => user["phone"], 
      :profile_picture_url => user["profile_picture_url"], 
      :friend_request => user["friend_request"], 
      :trust_request => user["trust_request"], 
      :venmo_id => user["id"], 
      :date_joined => user["date_joined"] )
    
    if @user.save

      @current_user_id = @user.venmo_id
      puts @current_user_id
      
  end
end
  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
    @current = User.all
   
    
    
  end

  def create
    @bet = Bet.new(params.require(:bet).permit(:challenge,
      :amount,
      :challenger,
      :challengee) )
    if @bet.save
      # render json: @bet, status: :created
      redirect_to bets_path
    end
    
  end

 end
