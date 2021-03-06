class UsersController < ApplicationController

  respond_to :json

  # def fetch_user
  #   @user = User.find_by_id(params[:id])
  # end



  def index
    @users = User.all
  end

  def new
    # render :json => {:success => true, info: :info} # on success
    if params["code"]
      auth_code = params["code"]
    end 
    url = "https://api.venmo.com/v1/oauth/access_token"
    @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    user = @response["user"]
    @access_token = @response["access_token"]
    @refresh_token = @response["refresh_token"]
    @id = user["id"]

    friends = "https://api.venmo.com/v1/users/" + user["id"] + "/friends?"
    @retfriend = HTTParty.get(friends, :query => { "access_token" => @access_token})
    @data = @retfriend["data"]

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
      redirect_to bets_path

    end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    respond_with User.find(params[:id])
  end

end

  

end