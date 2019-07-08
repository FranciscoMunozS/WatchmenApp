class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProvidersDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @provider = current_user.providers.build
  end

  def edit
  end

  def create
    @provider = current_user.providers.build(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'El proveedor fue correctamente creado.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'El proveedor fue correctamente actualizado.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'El proveedor fue correctamente eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def authorized_user
      @provider = current_user.providers.find_by(id: params[:id])
      redirect_to providers_path, notice: "Sin autorización para acceder a este registro" if @provider.nil?
    end

    def provider_params
      params.require(:provider).permit(:rut, :name, :address, :phone, :contact, :item)
    end
end
