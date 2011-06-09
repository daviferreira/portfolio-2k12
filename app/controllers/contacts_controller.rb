class ContactsController < ApplicationController

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      @message = "Contato enviado, obrigado!"
      @class = "msg"
    else
      @message = "Todos os campos são de preenchimento obrigatório."
      @class = "erro"
    end
  end

end
