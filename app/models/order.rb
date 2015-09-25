class Order < ActiveRecord::Base
  has_many :order_details
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'invalid email' }
  validates :total, presence: true, :numericality => { :greater_than => 0 }
end
