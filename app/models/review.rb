class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :comment, presence: true

  scope :newest_first, -> { order(created_at: :desc) }
end
