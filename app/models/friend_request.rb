class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validate :not_self, :not_friends
  validates :receiver, presence: true, uniqueness: { scope: :sender, message: 'request already created' }

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

  def not_pending
    errors.add(:receiver, 'reciever already requested friendship') if receiver.requested_friends.include?(sender)
  end
end
