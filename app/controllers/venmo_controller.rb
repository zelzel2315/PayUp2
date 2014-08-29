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

    user_json = JSON.parse(user)
    Venmo.create(:username => user_json["user"]["username"])


    def index
        @betfeed = Venmo.find_by_sql("SELECT users.id, users.venmo_id, users.username, users.profile_picture_url MIN(order_details.unit_price) AS lowest_price, MAX(order_details.unit_price) AS highest_price, AVG(order_details.unit_price) AS average_price FROM customers "+
            "INNER JOIN orders ON customers.id = orders.customer_id "+
            "INNER JOIN order_details ON orders.id = order_details.order_id GROUP BY customers.id, customers.company_name ORDER BY 5;")
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