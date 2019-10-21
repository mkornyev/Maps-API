class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :comment_likes

  validates_presence_of :user, :post, :likes_count, :comment 

  scope :oldest_first, -> { order(date: :asc) }
  scope :chronological, -> { order(date: :desc) }

  #callbacks
  after_create :increment_comment_counts
  after_destroy :decrement_comment_counts

  def increment_comment_counts
  	post = Post.find(self.post)

  	if !post.nil?
  	  post.update_attribute(:comments_count, post.comments_count+1)
  	end
  end 

  def decrement_comment_counts
  	post = Post.find(self.post)

  	if !post.nil?
  	  post.update_attribute(:comments_count, post.comments_count-1)
  	end
  end 
end
