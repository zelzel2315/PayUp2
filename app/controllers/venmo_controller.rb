class VenmoController < ApplicationController
  def venmo
    
    if params["code"]
       auth_code = params["code"]
       # puts auth_code
    end

    url = "https://api.venmo.com/v1/oauth/access_token"
    response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    user = response["user"]
    id = user["id"]
    #     puts id
    # puts response

    token = response["access_token"]
    puts token  

    # getinfourl = "https://api.venmo.com/v1/me?access_token=" + token
    # getinfo = HTTParty.get(getinfourl)
    # puts getinfo

    urlgetfriend = "https://api.venmo.com/v1/users/" + id + "/friends?"
    puts urlgetfriend
    getfriend = HTTParty.get(urlgetfriend)

    puts getfriend


    # data = response["user"]
    # # @data.each do |item|
    # fullname = data["id"]
    # puts fullname
    
    # puts item
    
    # end
    
    

   end
   end