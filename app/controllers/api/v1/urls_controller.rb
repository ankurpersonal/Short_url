class Api::V1::UrlsController < ApplicationController
  def create
    new_url = Url.new(url_params)
    if new_url.save
      render json: {status: 'SUCCESS', data:new_url}, status: :ok
    else
      if new_url.errors.messages[:given_link] == ["URL already exist"]
        url = Url.find_by(url_params)
        render json: {status: 'SUCCESS', data:url}, status: :ok
      else
        render json: {status: 'SUCCESS', data:url.errors}, status: 400
      end
    end
  end

  def show
    @url = URL.find(params[:short_link])
    render json: {status: 'SUCCESS', data:@url.given_link}, status: :ok
  end

  private
  def url_params
    params.require(:url).permit(:given_link)
  end
end
