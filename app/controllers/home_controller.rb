# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index

  end

  def show
    @ambulances = Ambulance.where(:region_id => params[:id] ).paginate(:page => params[:page])

    @city = Region.find( params[:id])
  end

end
