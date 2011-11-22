#encoding: utf-8
class SessionsController < ApplicationController

def new
    @usuario = Usuario.new
    render :action => 'new'
    end

def create
    @usuario = Usuario.autenticar(params[:usuario][:email], params[:usuario][:senha])
     if @usuario
        self.usuario_atual = @usuario
        flash[:success] = "Bem vindo"
        redirect_to produtos_url
    else
        flash.now[:error] = "Não foi possivel logar com os dados enviados"
        new
    end
   end
    def destroy
       resert_session
       flash[:success]= "Você saio com sucesso da aplicacao"
    end

end