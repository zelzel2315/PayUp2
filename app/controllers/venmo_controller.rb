
class VenmoController < ApplicationController
  def index
    
    if params["code"]
       auth_code = params["code"]
       # puts auth_code
    end

    url = "https://api.venmo.com/v1/oauth/access_token"
    response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    
    user = response["user"]
    # user_ret = user.parsed_response
    # id = user["id"]
    #     puts id
    # puts response

    # token = response["access_token"]
    # puts token  
    puts user
    # user_json = user.parsed_response
    @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => user["about"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    if @user.save
        redirect_to users_path
    end



    # getinfourl = "https://api.venmo.com/v1/me?access_token=" + token
    # getinfo = HTTParty.get(getinfourl)
    # puts getinfo

    # urlgetfriend = "https://api.venmo.com/v1/users/" + id + "/friends?"
    # puts urlgetfriend
    # getfriend = HTTParty.get(urlgetfriend)

    # puts getfriend


    # data = response["user"]
    # # @data.each do |item|
    # fullname = data["id"]
    # puts fullname
    
    # puts item
    
    # end
    
    

   end
   end