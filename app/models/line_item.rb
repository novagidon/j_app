class LineItem < ApplicationRecord

  #belongs_to :order
  belongs_to :product
  belongs_to :cart
  validates :category, uniqueness: true

  def total_price
    product.price * quantity
  end


end
