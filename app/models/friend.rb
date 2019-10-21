class Friend < ApplicationRecord
  belongs_to :user1
  belongs_to :user2

  validates_presence_of :user1, :user2, :are_friends

  # Callbacks
  after_create :update_friend_counts

  def update_friend_counts
  	firstUser = User.find(self.user1)
  	secondUser = User.find(self.user2)

  	if !firstUser.nil? && !secondUser.nil?
  	  firstUser.update_attribute(:friends_count, firstUser.friends_count + 1) 	
  	  secondUser.update_attribute(:friends_count, secondUser.friends_count + 1) 	
  	end
  end
  
end
