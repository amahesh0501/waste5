class Post < ActiveRecord::Base

  attr_accessible :youtube_id, :title, :description, :comedian_name, :date, :view_count, :duration, :rating
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true
end