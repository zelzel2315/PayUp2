FactoryGirl.define do 
	factory :bet do
		is_accepted true
		amount 1.00
		challenge "arm wrestle"
		winnder_id 23
	end
end