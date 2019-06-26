class UsersController < ApplicationController
  before_action :must_be_admin

  def index
    @users = User.all
  end

  private

  def must_be_admin
    unless current_user.admin?
      redirect_to tickets_path, alert: 'No tiene los permisos para acceder a este modulo'
    end
  end
end
