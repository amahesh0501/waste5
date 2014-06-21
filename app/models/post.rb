class Post < ActiveRecord::Base

  attr_accessible :youtube_id, :title, :description, :comedian_id, :date, :view_count, :duration, :rating, :category, :image_url, :posts_count
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true
  belongs_to :comedian

  def self.search(search)
    if search
      find(:all, :conditions => ['lower(title) LIKE ?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
  
end