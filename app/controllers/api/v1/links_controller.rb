class Api::V1::LinksController < ApplicationController
  before_action :authorize!

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      link.send_to_hot_links
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
