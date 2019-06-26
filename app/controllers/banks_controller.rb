class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorized_user, only: [:edit, :update, :destroy]

  def index
    @banks = Bank.all
  end

  def show
  end

  def new
    @bank = current_user.banks.build
  end

  def edit
  end

  def create
    @bank = current_user.banks.build(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Banco creado correctamente.' }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to @bank, notice: 'Banco actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank.destroy
    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'Banco eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bank
      @bank = Bank.find(params[:id])
    end

    def authorized_user
      @bank = current_user.banks.find_by(id: params[:id])
      redirect_to banks_path, notice: "Sin autorización para acceder a este registro" if @bank.nil?
    end

    def bank_params
      params.require(:bank).permit(:name)
    end
end
