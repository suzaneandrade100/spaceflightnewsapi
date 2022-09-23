class Article < ApplicationRecord
  validates :title, :url, :imageUrl, :newsSite, :summary, :publishedAt, presence: true
end
