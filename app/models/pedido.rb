class Pedido < ActiveRecord::Base

  has_many :itens #, :class_name => 'Item', :foreign_key => :pedido_id
  has_many :produtos, :through => :itens

  def adicionar_produto( produto, quantidade )
    item = self.itens.detect { |item| item.produto == produto }
    if item
      item.incrementar_quantidade( quantidade )
      item.save
    else
      self.itens.create(
          :produto_id => produto.id,
          :quantidade => quantidade )
    end

  end

  def preco_total
    self.itens.inject( 0 ) do |acumulado, item|
      acumulado + item.preco_total
    end
  end

end