class Admin::ProdutosController < Admin::BaseController

  def index
    @produtos = paginate( Produto )
  end

end