FactoryGirl.define do 
	factory :bet do
		is_accepted true
		amount 1.00
		challenge "arm wrestle"
		winner_id 23
	end
end