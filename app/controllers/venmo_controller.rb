class VenmoController < ApplicationController

    def bet
        @email = params[:email]
        @amount = params[:amount]
        @access_token = params[:access_token]
         
        url = "https://api.venmo.com/v1/payments"
        @amount = HTTParty.post(url, :query => { "access_token" => @access_token, :email => @email, :amount => @amount, :note => 'PayUp'})
        redirect_to home_path(@amount)
    end
 


 def home
    # # Look to see if the url has a code in it
    if params["code"]
       auth_code = params["code"]

       # puts auth_code
    end 
    
    # set the url to get an access token

    url = "https://api.venmo.com/v1/oauth/access_token"
    
    # call httpart to trade the code for an access token 
    @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})


    # save the access token as a variable
    @access_token = @response["access_token"]


    # call the user JSON out of response
    user = @response["user"]
    
    #create a new user with all of the attributes below
    # @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => user["about"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    
    # if the user saves then redirect to the venmo path
    # if @user.save
       
    end
    end

