class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product_id, presence: true
  validates :qty, presence: true, :numericality => { :greater_than => 0 }
end
