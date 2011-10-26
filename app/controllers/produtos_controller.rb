# encoding: utf-8
class ProdutosController < ApplicationController

  def index
    @produtos = Produto.all
    flash.now[:success] = 'Isso é um flash com sucesso'

    respond_to do |format|
      format.html
      format.json { render :json => @produtos }
      format.xml  { render :xml  => @produtos }
    end
  end

  def show
    @produto = Produto.find( params[:id] )
  end

end