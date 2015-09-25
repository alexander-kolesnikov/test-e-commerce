class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :image

  belongs_to :category

  validates :category, presence: true

  paginates_per 9
end
