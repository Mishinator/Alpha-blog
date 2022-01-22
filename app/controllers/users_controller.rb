class UsersController< ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :require_user, only: [:edit, :update]
   before_action :correct_user, only: [:edit, :update, :destory]
   

   def show
      @articles=  @user.articles.paginate(page: params[:page], per_page: 3)
   end
      
      def index
         @users=User.paginate(page: params[:page], per_page: 5)
      end
   
   def new
     @user=User.new
    end

    def create
     @user=User.new(user_params)
     if @user.save
      ConfirmMailer.with(user: @user).new_confirm_email.deliver_later
      session[:user_id] = @user.id
        flash[:notice]="Welcome to the Alpha Blog, #{@user.username}you have succsessfuly sign up"
        redirect_to articles_path
     else 
        render 'new'
      end
     end

def destroy
 @user.destroy if
 session[:user_id]=nil if @user == current_user
 flash[:notice]= "Account and all associated articles successfully deleted"
 redirect_to articles_path
end

def edit
end

def update
  if @user.update(user_params)
    flash[:notice]="  Your account information was successfully updated"
     redirect_to @user
  else
   render 'edit'
  end
end

private 
def user_params
    params.require(:user).permit(:username, :email, :password)
end

def set_user
   @user= User.find(params[:id])
end

def correct_user
 if current_user != @user  && !current_user.admin?
   flash[:alert]= "You didn't have this rules"
   redirect_to @user
 end

end

end 
