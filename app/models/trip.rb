class Trip < ApplicationRecord
  belongs_to :user
  has_one :post

  validates_presence_of :user, :from_location, :distance, :start_date, :visible
  # to_location & end_date not required 

  scope :newest, -> { order(date: :desc) }
  scope :for_user,  -> (user_id) { where(user_id: user_id) }

  #Callback
  
  
end
