class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :flash => { :success => 'Usuario creado correctamente.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to @user, :flash => { :success => 'Datos de usuario correctamente actualizado.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'Usuario eliminado correctamente.' }
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, role_ids: [])
    end
end
