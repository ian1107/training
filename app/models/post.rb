class Post < ApplicationRecord
  include SampleModule

  has_many :tags
  has_many :comments, as: :replies, dependent: :destroy
  belongs_to :users

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 200 }
  validates :status, inclusion: { in: %w(draft published archived),
                                  message: "%{value} is not a valid status" }

  scope :drafts, -> { where status: 'draft' }
  scope :published, -> { where status: 'published' }

  scope :user_status, -> (user) { where user_id: user, status: 'draft' }

  validate :validate

  def validate
    self.errors.add(:base, 'Only one draft post allowed per user') if self.status == 'draft' && user_status > 1

    self.errors.add(:base, 'Invalid words used in post') if bad_words(self.body)
  end
end
