class ItensController < ApplicationController

  def index
  end

  def create
    if pedido_atual.new_record?
      pedido_atual.save
      session[:pedido_id] = pedido_atual.id
    end

    produto = Produto.find( params[:produto_id] )
    pedido_atual.adicionar_produto( produto, params[:quantidade] )

    respond_to do |format|
      format.html do
        flash[:success] = 'Produto adicionado com sucesso'
        redirect_to produto_url( produto )
      end
    end

  end

end