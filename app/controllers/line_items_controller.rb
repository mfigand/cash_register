# frozen_string_literal: true

class LineItemsController < ApplicationController
  def create
    chosen_product = Product.find_by(id: params[:product_id])
    service = LineItems::Create.call(product: chosen_product, basket: @current_basket)

    if service.success?
      @line_item = service.data[:line_item]
    else
      flash[:error] = service.data[:error]
    end

    redirect_to basket_path(@current_basket)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to basket_path(@current_basket)
  end
end
