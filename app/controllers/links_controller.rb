class LinksController < ApplicationController

  def new
    @link = Link.new
    @links = Link.all
  end

  def show
    @link = Link.find_by(identifier: params[:identifier])
    redirect_to @link.original_link
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Short link generated"
      redirect_to root_path
    else
      flash[:danger] = "This is not a valid url"
      redirect_to root_path
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def link_params
      params.require(:link).permit(:original_link)
    end
end
