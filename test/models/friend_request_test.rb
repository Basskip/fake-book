require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @request = FriendRequest.new(sender_id: users(:cameron).id,
                                     receiver_id: users(:rubick).id)
  end

  test "should be valid" do
    assert @request.valid?
  end

  test "should require a sender_id" do
    @request.sender_id = nil
    assert_not @request.valid?
  end

  test "should require a receiver_id" do
    @request.receiver_id = nil
    assert_not @request.valid?
  end
end
