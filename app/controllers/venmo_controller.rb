class VenmoController < ApplicationController

def bet
    @email = params[:email]
    @amount = params[:amount]
    @access_token = params[:access_token]
    url = "https://api.venmo.com/v1/payments"
    @amount = HTTParty.post(url, :query => { "access_token" => @access_token, :email => @email, :amount => @amount, :note => 'PayUp'})
    render new_user_path
end
def new
    if params["code"]
        auth_code = params["code"]
    end 
    url = "https://api.venmo.com/v1/oauth/access_token"
    @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    user = @response["user"]
    @access_token = @response["access_token"]
    @refresh_token = @response["refresh_token"]
    friends = "https://api.venmo.com/v1/users/" + user["id"] + "/friends?"
    @retfriend = HTTParty.get(friends, :query => { "access_token" => @access_token})
    @data = @retfriend["data"]
    @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => @response["access_token"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    if @user.save
        render home_path
    end
end

# def friends
#     friends = "https://api.venmo.com/v1/users/" + @venmo_id + "/friends?"
#     @retfriend = HTTParty.get(friends, :query => {:about => @response["access_token"]})
#     redirect_to home_path(@retfriend)
# end
 

<<<<<<< HEAD
    # call the user JSON out of response
    user = @response["user"]
    @venmo_id = user["id"]
    puts @venmo_id
    #create a new user with all of the attributes below
     @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => user["about"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    lipstick = "https://api.venmo.com/v1/users/1493045790900224624/friends?" + @access_token
     @friends = HTTParty.get(url)

     puts @friends



    # if the user saves then redirect to the venmo path
        if @user.save
       
        end
    end
=======

#  def home
#     if params["code"]
#        auth_code = params["code"]
#     end 
#     url = "https://api.venmo.com/v1/oauth/access_token"
#     @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
#     @access_token = @response["access_token"]
#     @refresh_token = @response["refresh_token"]
#     user = @response["user"]
#     @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => @response["access_token"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    
#     # if the user saves then redirect to the venmo path

#      if @user.save
       
#      end
#     end
>>>>>>> 0104b281d7d030753b105126366a976763dbaf33
end

