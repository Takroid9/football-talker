class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    @contact.talker_id = current_talker.id
    if @contact.save
      redirect_to contacts_complete_path
    else
      render :new
    end
  end

  def complete
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:talker_id, :title, :body, :is_check, :is_complete)
  end
end
