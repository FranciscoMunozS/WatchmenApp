class DashboardController < ApplicationController
  def index
    @providers = Provider.all
    @banks = Bank.all
    @tickets = Ticket.all
    @users = User.all
  end
end
