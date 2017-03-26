class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:danger] = nil
    else
      flash.now[:danger] = 'Cannot send message'
      render :new
    end
  end
end
