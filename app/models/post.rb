class Post < ActiveRecord::Base

  attr_accessible :youtube_id, :title, :description, :comedian_name, :date, :view_count, :duration, :rating
  validates :youtube_id, presence: true
  validates :youtube_id, uniqueness: true

  include PgSearch
    pg_search_scope :search, against: [:title, :description, :comedian_name],
      using: { tsearch: { dictionary: "english" } }
    def self.text_search(query)
      if query.present?
        search(query)
      else
        scoped
      end
    end
end