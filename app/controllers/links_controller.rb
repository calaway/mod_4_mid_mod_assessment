class LinksController < ApplicationController
  before_action :authorize!

  def index
    @link = Link.new
    @links = current_user.links.reload
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to links_path
    else
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      redirect_to links_path
    else
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
