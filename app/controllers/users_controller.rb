class UsersController < ApplicationController
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page]).per(2)
  end
end
