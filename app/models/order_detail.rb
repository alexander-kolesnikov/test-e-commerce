class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product_id, :qty, presence: true
  validates :qty, :numericality => { :greater_than => 0 }
end
