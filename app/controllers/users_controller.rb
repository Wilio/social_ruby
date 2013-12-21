class UsersController < ApplicationController

  def index
    @users = users.all
  end

end
