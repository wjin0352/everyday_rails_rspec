FactoryGirl.define do
  factory :contact do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }

    after(:build) do |contact|
      [:home_phone, :work_phone, :mobile_phone].each do |phone|
        contact.phones << FactoryGirl.build(:phone,
        phone_type: phone, contact: contact)
      end
    end

    factory :invalid_contact do
      firstname nil
    end
  end

end




# Faker is a fake data generator for fake names, addresses, sentences, and good for testing.
# Now our specs will use random email address each time the phone factory is used.

# this code gives us a factory we can use throughout our specs.  Essentially
# whenever we create test data via FactoryGirl.create(:contact), we have
# attributes to work with without having to create them everytime.

# the 'sequence' is a feature provided by FactoryGirl that automatically
# increments n inside the block, yielding johndoe1@example.com, johndoe2@exmaple.com
# etc.  sequences are useful for models that have uniqueness validation.  We can
# use Faker to generate our emails, names etc to take the place of sequence.
