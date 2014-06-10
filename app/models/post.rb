class Post < ActiveRecord::Base

  attr_accessible :youtube_id, :title, :description, :comedian_id, :date, :view_count, :duration, :rating, :category, :image_url
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true
  belongs_to :comedian

  include PgSearch
    pg_search_scope :search, against: [:title, :description],
      using: { tsearch: { dictionary: "english" } }
    def self.text_search(query)
      if query.present?
        search(query)
      else
        scoped
      end
    end
end