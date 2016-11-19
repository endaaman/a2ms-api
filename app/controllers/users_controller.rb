class UsersController < ApplicationController
  before_action :needs_admin, only: [:index, :approve, :reject, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.new(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password],
    )
    success = @user.save
    if success
      head 201
      return
    end
    render status: 422
  end

  def destroy
    User.destroy params[:id]
    head 204
  end

  def approve
    set_approval true
  end

  def reject
    set_approval false
  end

  private

  def set_approval(approved)
    @user = User.find_by id: params[:id]
    if @current_user.id == @user.id
      head 422
      return
    end

    success = @user.update(
      approved: approved
    )
    render 'users/approval'
  end


end
