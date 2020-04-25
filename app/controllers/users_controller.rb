class UsersController < ApplicationController
 before_action :user_signed_in?, only: %i[create destroy]

 def index
  @users = User.all
 end
end
