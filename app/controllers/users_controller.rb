class UsersController < ApplicationController
 before_action :user_signed_in?, only: %i[create destroy]

 def index
  @user = User.all
 end
end
