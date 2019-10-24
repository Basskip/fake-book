class FixReceiverSpelling < ActiveRecord::Migration[5.2]
  def change
    rename_column :friend_requests, :reciever_id, :receiver_id
  end
end
