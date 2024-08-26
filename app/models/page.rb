class Page < ApplicationRecord
  belongs_to :chapter
  has_one_attached :page_image
  extend FriendlyId
  friendly_id :page_number, use: :slugged
  validates :chapter, :page_number, :page_image, presence: true
  validates :page_number, uniqueness: true

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

  def next
    self.class.sorted.where("page_number > ?", page_number).first
  end

  def previous
    self.class.sorted.where("page_number < ?", page_number).last
  end

  def first
    self.class.sorted.first
  end

  def last
    self.class.sorted.last
  end
end

# Page.draft
# Page.published
# Page.scheduled