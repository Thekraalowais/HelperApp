class ServicesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
# before_create :set_default_image
# has_attached_file :image, default_url: "coin2.jpg"
  def index
    @services = Service.all.where("name ILIKE ?", "%#{params[:search]}%").order("created_at DESC")
  end

  def show
    # raise "te"
    @service = Service.find_by_id(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    service = current_user.services.create(service_params)
    redirect_to service_path(service)
  end

  def edit
    # rails "ss"
    @service = Service.find_by_id(params[:id])
  end

  def update
    service = Service.find_by_id(params[:id])
    service.update(service_params)
    redirect_to service_path(service)
  end

  def destroy
    service = Service.find_by_id(params[:id])
    service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :location, :price, :contact, :time, :user_id, :image)
  end
end
