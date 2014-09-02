
class VenmoController < ApplicationController
def bet
    @email = params[:email]
    @amount = params[:amount]

    puts @email
    puts @amount

    url = "https://api.venmo.com/v1/payments"
    @amount = HTTParty.post(url, :query => {:access_token => '2GnsQsVeFtZtqfMk2MwpGBsqH2CPjTjP', :email => @email, :amount => @amount, :note => 'PayUp'})
    redirect_to home_path(@amount)
  end
 def new
    # Look to see if the url has a code in it
    if params["code"]
       auth_code = params["code"]
    end
    
    # set the url to get an access token
    url = "https://api.venmo.com/v1/oauth/access_token"
    
    # call httpart to trade the code for an access token 
    @response = HTTParty.post(url, :query => {:client_id => '1917', :client_secret => 'bevp84EhbeJNt39mb6GgFA96jxCJ7Ata', :code => auth_code})
    
    # save the access token as a variable
    @access_token = @response["access_token"]

    # call the user JSON out of response
    user = @response["user"]
    
    # create a new user with all of the attributes below
    @user = User.new(:username => user["username"], :first_name => user["first_name"], :last_name => user["last_name"], :display_name => user["display_name"], :is_friend => user["is_friend"], :friends_count => user["friends_count"], :about => user["about"], :email => user["email"], :phone => user["phone"], :profile_picture_url => user["profile_picture_url"], :friend_request => user["friend_request"], :trust_request => user["trust_request"], :venmo_id => user["id"], :date_joined => user["date_joined"] )
    
    # if the user saves then redirect to the venmo path
    if @user.save
        redirect_to venmo_path
    end
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
        redirect_to venmo_path
    end

    def index
        # @betfeed = Venmo.find_by_sql("SELECT users.id, users.venmo_id, users.username, users.profile_picture_url MIN(order_details.unit_price) AS lowest_price, MAX(order_details.unit_price) AS highest_price, AVG(order_details.unit_price) AS average_price FROM customers "+
        #     "INNER JOIN orders ON customers.id = orders.customer_id "+
        #     "INNER JOIN order_details ON orders.id = order_details.order_id GROUP BY customers.id, customers.company_name ORDER BY 5;")
        @betcount = Venmo.find_by_sql("SELECT users.username, COUNT(DISTINCT bets.id) AS made_bets FROM bets "+
            "INNER JOIN user_bets ON bets.id = user_bets.bet_id "+
            "INNER JOIN users ON user_bets.user_id = users.id GROUP BY users.username ORDER BY 1;")
    end

    # def index
    #     @betfeed = Venmo.find_by_sql("SELECT users.id, users.venmo_id, users.username, users.profile_picture_url MIN(order_details.unit_price) AS lowest_price, MAX(order_details.unit_price) AS highest_price, AVG(order_details.unit_price) AS average_price FROM customers "+
    #         "INNER JOIN orders ON customers.id = orders.customer_id "+
    #         "INNER JOIN order_details ON orders.id = order_details.order_id GROUP BY customers.id, customers.company_name ORDER BY 5;")
    # end


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