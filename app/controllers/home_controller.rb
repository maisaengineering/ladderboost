class HomeController < ApplicationController
  layout  'homepage'
  def index
    @users = User.all
  end
end
