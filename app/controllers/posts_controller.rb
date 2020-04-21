class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
  end  
end
