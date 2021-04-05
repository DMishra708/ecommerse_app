class Order < ApplicationRecord
  has_many :line_items
  belongs_to :user

  def total
    total = 0
    order_items.each do |item|
      total += item.quantity * item.product.price
    end
    total
  end
end
