class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :incoming_friend_requests, class_name: "FriendRequest", foreign_key: :reciever_id
  has_many :outgoing_friend_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :requested_friends, through: :outgoing_friend_requests, source: :reciever
  has_many :requesting_friends, through: :incoming_friend_requests, source: :sender
end
