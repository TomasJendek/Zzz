class AmbulanceController < ApplicationController
  def show
    @ambulance_item = AmbulanceItem.where(:ambulance_id => params[:id])

    @ambulance_type = Ambulance.find(params[:id])

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @ambulance_item }
    end
  end

  def show_ambulance

    respond_to do |format|
      format.html  # index.html.erb
    end
  end
end
