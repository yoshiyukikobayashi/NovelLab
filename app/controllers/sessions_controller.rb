class SessionsController < ApplicationController

  def new
  end

  def new_reader
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to mypage_user_articles_path(@user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def create_reader
    @reader = Reader.find_by(email: params[:session][:email].downcase)
    if @reader && @reader.authenticate(params[:session][:password])
      log_in_reader @reader
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render "new_reader.html.erb"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def destroy_reader
    log_out_reader
    redirect_to root_url
  end

end
