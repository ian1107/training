class Comment < ApplicationRecord
  include SampleModule

  belongs_to :users
  belongs_to :replies, polymorphic: true

  has_many :sub_comments, class_name: Comment, foreign_key: "main_comment_id", dependent: :destroy
  belongs_to :main_comment, class_name: Comment

  validates :description, presence: true, length: {maximum: 100}

end
