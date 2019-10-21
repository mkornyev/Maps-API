class AddAreFriendsToFriends < ActiveRecord::Migration[5.2]
  def change
    add_column :friends, :are_friends, :boolean
  end
end
