class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
   default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  DISH_CATEGORIES = ["First course", "Main course", "Drink"]

  validates :title, presence: true, length: { maximum: 50 }
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

  def total_price
    product.price * quantity
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

end
