class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json
  def index
    @group = Group.find(params[:group_id])
    @contacts = @group.contacts;
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])
    @group = @contact.group
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
    @group = @contact.group
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @group = Group.find(params[:group_id])
    @contact = @group.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to group_contact_path(@group,@contact), notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])
    @group = @contact.group
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to group_contact_path(@group,@contact), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to group_contacts_url }
      format.json { head :no_content }
    end
  end
end
