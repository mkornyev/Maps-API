class CommentLike < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates_presence_of :user, :comment

  #callbacks
  after_create :increment_like_counts
  after_destroy :decrement_like_counts

  def increment_like_counts
  	comment = Comment.find(self.comment)

  	if !comment.nil?
  	  comment.update_attribute(:likes_count, comment.likes_count+1)
  	end
  end 

  def decrement_like_counts
  	comment = Comment.find(self.comment)

  	if !comment.nil?
  	  comment.update_attribute(:likes_count, comment.likes_count-1)
  	end
  end
end
