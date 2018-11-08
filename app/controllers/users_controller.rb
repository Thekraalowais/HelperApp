class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
  end

  def new
  end

  # override the User destroy method
  # when destroy method is called on User model, we are updating the User’s deactivated column to true only if the user is not currently deactivated.
  def destroy
    raise "ss"
    # unless deactivated
    update_attributes(deactivated: true)
    # end

  end
end
