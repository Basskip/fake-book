class FriendRequest < ApplicationRecord
  validate :not_self, :not_friends
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def accept
    sender.friends << receiver
    destroy
  end

  private

  def not_self
    errors.add(:sender, "can't be equal to receiver") if sender == receiver
  end

  def not_friends
    errors.add(:receiver, 'sender and receiver are already friends') if sender.friends.include?(receiver)
  end
end
