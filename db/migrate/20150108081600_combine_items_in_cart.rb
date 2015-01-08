class CombineItemsInCart < ActiveRecord::Migration
  def up
    #замена нескольких записей для одного и тогоже товара в корзине одной записью
    Cart.all.each do |cart|
      #подсчет количества каждого товара в корзине
      sums = cart.line_items.group(:product_id).sum(:quantity)
      
      sums.each do |product_id, quantity|
        if quantity > 1
          #удаление отдельных записей
          Cart.line_items.where(product_id: product_id).delete_all
          
          #замена одной записью
          Cart.line_items.create(product_id: product_id,quantity: quantity)
        end
      end
    end
  end
end