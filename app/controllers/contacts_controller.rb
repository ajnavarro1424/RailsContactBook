class ContactsController < ApplicationController
  def index
    session[:sort]="given"
  end

  def register
    if (params[:given_name].nil?|| params[:family_name].nil?)
      redirect_to '/',alert: "Please enter both a given name and a family name!!"
    else

      @contact = Contact.new(given_name: params[:given_name], family_name: params[:family_name], email_address: params[:email_address], home_address: params[:home_address])

      if @contact.save
        session[:contact_id] = @contact.id
      end
      redirect_to '/list'
    end
  end

  def list
    session[:sort] = params[:sort] unless params[:sort].nil?
    puts session[:sort]
    if session[:sort]=="given"
      @contacts = Contact.all.order(:given_name)
    elsif session[:sort]=="family"
      @contacts = Contact.all.order(:family_name)
    end
  end

  def search
    @contacts = Contact.where("family_name= '%s'", params[:search].to_s )
    render('list.html.erb')

  end

  def update
    @contact_update = Contact.find(params[:contact_id])
    if !params[:given_name].strip.empty?
      @contact_update.given_name = params[:given_name]
    end
    if !params[:family_name].strip.empty?
      @contact_update.family_name = params[:family_name]
    end
    if !params[:email_address].strip.empty?
      @contact_update.email_address = params[:email_address]
    end
    if !params[:home_address].strip.empty?
      @contact_update.home_address = params[:home_address]
    end
    if !params[:phone_number].strip.empty? && !params[:phone_purpose].strip.empty? && @contact_update.phones.size < 3
      @phone = Phone.new(number: params[:phone_number], purpose: params[:phone_purpose], contact_id: params[:contact_id] )
      @phone.save
    end
    @contact_update.save
    redirect_to '/list'
  end

  def destroy
    @contact_destroy = Contact.find(params[:contact_id])
    @contact_destroy.destroy
    redirect_to '/list'
  end
end
