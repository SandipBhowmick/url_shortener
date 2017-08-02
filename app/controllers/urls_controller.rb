# Controller for only url access
class UrlsController < ApplicationController
  before_action :generate_shortened, only: :create
  def index
    @url = Url.new
    @urls = Url.all.order(count: :desc).limit(100)
  end

  def create
    @url = Url.new(url_params)
    @url.shortened_url = @shortened_url
    flash[:notice] = @url.errors.full_messages.join.to_s unless @url.save
    redirect_to root_path
  end

  def show
    url = Url.find_by(shortened_url: params[:id])
    redirect_to url.full_url
  end

  private

  def generate_shortened
    @shortened_url = SecureRandom.urlsafe_base64(4)
    generate_shortened if Url.find_by(shortened_url: @shortened_url)
  end

  def url_params
    params.require(:url).permit(:shortened_url, :full_url)
  end
end
