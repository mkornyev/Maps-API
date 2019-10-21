class UserSerializer < ActiveModel::Serializer
  attributes :id, :fname, :lname, :email, :profile_image_url, :bio, :friends_count, :miles_travelled
end
