class Friendship < ActiveRecord::Base
    validate :not_self
    after_create :create_inverse_relationship
    after_destroy :destroy_inverse_relationship
  
    belongs_to :user
    belongs_to :friend, class_name: 'User'
  
    private
  
    def create_inverse_relationship
      friend.friendships.create(friend: user) unless friend.friends.include?(user)
    end
  
    def destroy_inverse_relationship
      friendship = friend.friendships.find_by(friend: user)
      friendship.destroy if friendship
    end

    def not_self
        errors.add(:friend, "can't be equal to user") if user == friend
    end
  end