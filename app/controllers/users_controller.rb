class UsersController < ApplicationController
  def register
    @user = User.new;
  end

  def new
    @user = User.new(section_params)

    if @user.save && @user.password_confirmation == @user.password
      flash[:notice] = "Register successfully, you can now log in."
      redirect_to(:controller => 'main',:action => 'index')
    else
      flash[:notice] = "Problem occurred, check your password or change username."
      render('register')
    end
  end



  private def section_params
            params.permit(:username, :password, :password_confirmation)
          end
end
