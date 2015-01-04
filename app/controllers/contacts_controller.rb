class ContactsController < ApplicationController
	load_and_authorize_resource

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    #@contact = Contact.find(params[:id])
    @contact = Contact.first || Contact.create

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.first || Contact.create
  end


  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.first

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

end
