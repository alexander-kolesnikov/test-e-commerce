class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :image

  belongs_to :category
  has_many :order_details, :dependent => :delete_all

  validates :category, :title, :description, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0 }
  validates :stock_level, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  paginates_per 9
end
