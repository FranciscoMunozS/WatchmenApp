class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @providers = Provider.all
    @banks = Bank.all
    @tickets = Ticket.all
    @users = User.all
  end
end
