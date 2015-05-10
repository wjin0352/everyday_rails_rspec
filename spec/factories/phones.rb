FactoryGirl.define do
	factory :phone do
    association :contact
    phone { Faker::PhoneNumber.phone_number }

			# using inheritance to set up different 'types' of phones below
			factory :home_phone do
				phone_type 'home'
			end

			factory :work_phone do
				phone_type 'work'
			end

			factory :mobile_phone do
				phone_type 'mobile'
			end
	end


end

