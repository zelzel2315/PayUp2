class BetsController < ApplicationController
	 def pay
   	url = "https://api.venmo.com/v1/payments"
    @answer = HTTParty.post(url, :query => {:access_token => '2GnsQsVeFtZtqfMk2MwpGBsqH2CPjTjP', :email => "johnsonzman@gmail.com", :amount => '1', :note => 'PayUp'})
    redirect_to venmo_path
  end
end
