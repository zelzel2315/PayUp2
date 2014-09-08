require 'rails_helper'

RSpec.describe User, type: :model do 

  it { should have_many(:user_bets) }
 	it { should have_many(:bets) }
	it { should accept_nested_attributes_for(:bets) }
# it { should have(:username => user["username"], 
#       :first_name => user["first_name"], 
#       :last_name => user["last_name"], 
#       :display_name => user["display_name"], 
#       :is_friend => user["is_friend"], 
#       :friends_count => user["friends_count"], 
#       :about => @response["access_token"], 
#       :email => user["email"], 
#       :phone => user["phone"], 
#       :profile_picture_url => user["profile_picture_url"], 
#       :friend_request => user["friend_request"], 
#       :trust_request => user["trust_request"], 
#       :venmo_id => user["id"], 
#       :date_joined => user["date_joined"] )
end