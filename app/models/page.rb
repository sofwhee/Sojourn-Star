class Page < ApplicationRecord

  validates :chapter, presence: true
  validates :page_number, presence: true, uniqueness: true
end
