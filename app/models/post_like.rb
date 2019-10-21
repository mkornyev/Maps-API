class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :user, :post

  #callbacks
  after_create :increment_like_counts
  after_destroy :decrement_like_counts

  def increment_like_counts
  	post = Post.find(self.post)

  	if !post.nil?
  	  post.update_attribute(:like_count, post.like_count+1)
  	end
  end 

  def decrement_like_counts
  	post = Post.find(self.post)

  	if !post.nil?
  	  post.update_attribute(:like_count, post.like_count-1)
  	end
  end 
end
