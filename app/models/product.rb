class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :image

  belongs_to :category

  validates :category, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :stock_level, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  paginates_per 9
end
