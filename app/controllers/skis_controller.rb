class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def search
  end

  def index
    #before we create the actual form, we test the filtering thing "a la mano"
    @skis = Ski.where(city: 'Lyon').sort_by { |ski| ski.size }
  end

  def show
    @ski = Ski.find(params[:id])

  end

  def create
  end

  def new
  end
end
