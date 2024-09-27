class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name,     presence: true, uniqueness: true
  # validates :thumbnail_url, format: { with: URI.regexp }
end
