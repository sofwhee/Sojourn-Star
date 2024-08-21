class Chapter < ApplicationRecord
  has_many :pages
  validates :name, :chapter_number, presence: true

  scope :sorted, -> { order(chapter_number: :asc) }

  def last
    self.class.sorted.last
  end
end


