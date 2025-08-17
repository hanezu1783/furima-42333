class ShippingAddress < ApplicationRecord
  include ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
end
