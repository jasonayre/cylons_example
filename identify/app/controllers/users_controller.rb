class UsersController < ApplicationController
  def create
    resource = User.new(user_params)
    resource.save

    respond_with(resource)
  end

end
