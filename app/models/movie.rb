class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  # validates :photo, presence: true
end
