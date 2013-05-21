require 'test_helper'

class CheckCallbackTest < ActiveSupport::TestCase
   test "an invalid record stays invalid" do
     # we validate uniqueness of name
     rec1 = CheckCallback.create!(:name=>'something')
     rec2 = CheckCallback.new(:name=>'something')
     assert rec2.invalid?  # it's not unique so it should be false
     assert_match(/taken/, rec2.errors[:name].join)
     assert rec2.save(:validate=>false)
     assert CheckCallback.count == 2 #it should have been written even though it's invalid
     assert rec2.invalid?
     rec2 = CheckCallback.last
     assert rec2.invalid?  # even though it's saved it's still not unique so it should be invalid
     rec1 = CheckCallback.first
     assert rec1.invalid?  # even though it was saved first it's now not unique so it should be invalid
   end
end
