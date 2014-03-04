class Post < ActiveRecord::Base

  attr_accessible :youtube_id, :title, :description, :seconds, :date
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true
end