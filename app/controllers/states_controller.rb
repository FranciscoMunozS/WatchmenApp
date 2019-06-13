class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @states = State.all
  end

  def show
  end

  def new
    @state = current_user.states.build
  end

  def edit
  end

  def create
    @state = current_user.states.build(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to @state, notice: 'Estado creado correctamente.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to @state, notice: 'Estado actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to states_url, notice: 'Estado eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_state
      @state = State.find(params[:id])
    end

    def state_params
      params.require(:state).permit(:name)
    end
end
