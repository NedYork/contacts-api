require 'byebug'

class ContactsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # byebug

    render json: (@user.contacts + @user.shared_contacts)
  end

  def create
    # contact = contact.new(params[:contact].permit(:name, :email))
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])
    success = @contact.update(contact_params)
    # redirect_to cat_url(@cat)
    if success
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy

    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contact
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
