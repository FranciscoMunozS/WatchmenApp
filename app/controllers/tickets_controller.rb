class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :complete]
  before_action :authenticate_user!
  

  def index
    respond_to do |format|
      format.html
      format.json { render json: TicketsDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @ticket = current_user.tickets.build
  end

  def edit
  end

  def complete
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)

    respond_to do |format|
      if @ticket.save

        NewRecordJob.set(wait: 10.seconds).perform_later(@ticket)

        format.html { redirect_to @ticket, notice: 'Registro creado correctamente.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Registro actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Registro eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(
        :correlative, :memo, :memo_income_date,
        :ticket_number, :amount, :currency, :due_date, :caution, :project_name,
        :bip, :departed_office, :departed_date, :analist, :devolution, :provider_id,
        :bank_id, :first_notification, :second_notification, :state, :type_ticket
      )
    end
end
