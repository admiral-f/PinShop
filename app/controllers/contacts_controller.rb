class ContactsController < ApplicationController

  def new
  end

  def create
    @contact=Contact.new(contact_params)
    if @contact.save
      Pony.mail(
          :to => "admiral-f@yandex.ru",
          :from => @contact.email,
          :subject => @contact.name + " has contacted you",
          :body => @contact.email + " write message: " + @contact.message,
          :via => :smtp,
          :via_options => { 
          :address              => 'smtp.yandex.ru', 
          :port                 => '25', 
          :enable_starttls_auto => true, 
          :user_name            => 'admiral-f', 
          :password             => 'kalinin1987', 
          :authentication       => :plain
        })
        
    else
      render action: 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
