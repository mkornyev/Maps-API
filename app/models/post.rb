class Post < ApplicationRecord
  belongs_to :trip

  has_many :post_likes
  has_many :comments

  validates_presence_of :trip, :tagline, :like_count, :comments_count, :date

	scope :chronological, -> { order(date: :desc) }
	scope :most_popular, -> { order(like_count: :desc) }

	# See if passing array for the following is possible:
	scope :for_user,  -> (user_id) { joins(:trips).where(user_id: user_id) } 

end
