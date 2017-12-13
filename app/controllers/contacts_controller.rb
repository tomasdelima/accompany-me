class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :init_contact, only: [:new, :create]
  before_action :find_contact, only: [:home, :show, :update, :edit, :convert]
  before_action :assign_contact_attributes, only: [:create, :update]

  def new
  end

  def create
    if @contact.save
      Friendship.create(user: current_user, contact: @contact)
      redirect_to contact_path(@contact)
    else
      params[:errors] = @contact.errors.messages
      render :new
    end
  end

  def show
  end

  def update
    if @contact.save
      redirect_to contact_path
    else
      params[:errors] = @contact.errors.messages
      render :edit
    end
  end

  def convert
    @contact.convert
    render :show
  end

  protected

    def init_contact
      @object = @contact = Contact.new(email: params[:email])
    end

    def find_contact
      @object = @contact = Contact.find(params[:id])
    end

    def assign_contact_attributes
      @contact.assign_attributes(contact_params)
    end

    def contact_params
      params.require(:contact).permit(:email, :phone, :celphone, :address, :name, :observations, :birthdate, :age, :age_changed_at)
    end
end
