class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pedido_atual

  protected

  def pedido_atual
    @pedido_atual ||= if !session[:pedido_id].blank?
      Pedido.find( session[:pedido_id] )
    else
      Pedido.new
    end
  end


end