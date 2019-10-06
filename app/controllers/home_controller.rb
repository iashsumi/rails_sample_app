#class HomeController < ActionController::Base
class HomeController < ApplicationController
  def top
    @administrator = Administrator.new
  end
end
