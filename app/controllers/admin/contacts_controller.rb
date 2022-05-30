class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    byebug
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to admin_contacts_path
  end
  
  private
  
  def contact_params
    params.require(:contact).permit(:talker_id, :title, :body, :is_check, :is_complete)
  end
end
