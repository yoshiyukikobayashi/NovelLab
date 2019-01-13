module SessionsHelper
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_in_reader(reader)
    session[:reader_id] = reader.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_reader
    @current_reader ||= Reader.find_by(id: session[:reader_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  def is_logged_in_reader?
    !session[:reader_id].nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def log_out_reader
    session.delete(:reader_id)
    @current_user = nil
  end


end
