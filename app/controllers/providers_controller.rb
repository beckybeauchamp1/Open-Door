class ProvidersController < ApplicationController
  def index
    @providers=Provider.all
  end
  def show
    @provider=Provider.find(params[:id])
  end
  def edit
    @provider=Provider.find(params[:id])
  end
  def new
    @provider=Provider.new
  end
  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to @provider
    else
      render "new"
    end
  end
  def update
    @provider = Provider.find(params[:id])
    if @provider.update(provider_params)
      redirect_to @provider
    else
      render "edit"
    end
  end
  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to providers_path
  end
  private
    def provider_params
      params.require(:provider).permit(:organization_name, :POC_first_name, :POC_last_name, :photo_url, :city, :email, :phone_number, :bio)
    end
end
