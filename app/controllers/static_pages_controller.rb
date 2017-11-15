class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def home
    @products = Product.order(:title)
  end

  def about
  end

  def contact
  end

end
