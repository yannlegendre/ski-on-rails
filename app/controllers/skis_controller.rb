class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  def search
  end

  def index
    #before we create the actual form, we test the filtering thing "a la mano"
    @skis = Ski.where(city: 'Lyon')
  end

  def show
  end

  def create
  end

  def new
  end

end
