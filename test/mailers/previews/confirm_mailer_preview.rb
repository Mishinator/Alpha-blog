# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview
    def new_confirm_email
        # Set up a temporary order for the preview
        user =  User.new(username: "Jaden Smith", email: "jaden@gmail.com", password_digest:"12346wasd")
    
        ConfirmMailer.with(user: user).new_confirm_email
      end
end
