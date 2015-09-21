class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attachment :image
end
