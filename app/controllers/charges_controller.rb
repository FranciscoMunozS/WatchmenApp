class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @charges = Charge.all
  end

  def show
  end

  def new
    @charge = current_user.charges.build
  end

  def edit
  end

  def create
    @charge = current_user.charges.build(charge_params)

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Cargo creado correctamente.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Cargo actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Cargo eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params.require(:charge).permit(:name)
    end
end
