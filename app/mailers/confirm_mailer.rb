class ConfirmMailer < ApplicationMailer
    def new_confirm_email
        @user = params[:user]
    
        mail(to: "mishaneverovsky@gmail.com", subject: "You got a new USER!")
      end
end
