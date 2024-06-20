class Page < ApplicationRecord

  validates :chapter, presence: true
  validates :page, presence: true, uniqueness: true
end
