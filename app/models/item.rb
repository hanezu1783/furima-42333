class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end
end
