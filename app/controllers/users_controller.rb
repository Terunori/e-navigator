class UsersController < ApplicationController
  before_action :authenticate_user!,
  # before_action :authenticate_user!, only: [:show]

  # TODO set CRUD of user
  def index
    @users = User.all
  end

end
