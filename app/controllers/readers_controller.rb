class ReadersController < ApplicationController

  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      log_in_reader @reader
      current_reader
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def reader_params
    params.require(:reader).permit(:name, :email, :password, :password_confirmation)
  end

  def search_params
    params.permit(:id)
  end

  def target_reader
    Reader.find(search_params[:id])
  end

end
