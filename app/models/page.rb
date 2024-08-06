class Page < ApplicationRecord
  belongs_to :chapter
  has_one_attached :page_image

  validates :chapter, :page_number, :page_image, presence: true

  scope :sorted, -> { order(page_number: :asc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end

# Page.draft
# Page.published
# Page.scheduled