class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :incoming_friend_requests, class_name: "FriendRequest", foreign_key: :receiver_id, dependent: :destroy
  has_many :outgoing_friend_requests, class_name: "FriendRequest", foreign_key: :sender_id, dependent: :destroy
  has_many :requested_friends, through: :outgoing_friend_requests, source: :receiver
  has_many :requesting_friends, through: :incoming_friend_requests, source: :sender
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
