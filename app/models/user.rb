class User < ApplicationRecord

	has_many :trips
	has_many :posts, through: :trips
	has_many :comments
  has_many :friends
  has_many :post_likes
  has_many :comment_likes
 
  validates_presence_of :fname, :lname, :email
  # profile_img, bio, friends, and miles_travelled are set in the app 

  scope :alphabetical, -> { order(:fname, :lname) }
  scope :distance_travelled, -> { order(miles_travelled: :desc) }
  scope :most_friends, -> { order(friends_count: :desc) }
  scope :user_friends,  -> {  joins(:friends).where(are_friends: true) }
  scope :user_strangers,  -> {  joins(:friends).where(are_friends: false) }

  # Callbacks
  before_save :init_fields 

  def name
    return fname + " " + lname
  end 

  def init_fields
    if friends_count.nil?
      self.friends_count = 0; 
    end

    if miles_travelled.nil?
      self.miles_travelled = 0; 
    end
  end

end
