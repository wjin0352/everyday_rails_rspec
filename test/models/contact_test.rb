require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  describe Contact do
    it 'is valid with a firstname, lastname and email'
    it 'is invalid without a firstname'
    it 'is invalid without a lastname'
    it 'is invlaid without an email address'
    it 'is invalid with a duplicate email address'
    it "returns a contact's full name as a string"
  end

end
