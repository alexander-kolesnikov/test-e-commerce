class Order < ActiveRecord::Base
  has_many :order_details
  validates :email, presence: true
end
