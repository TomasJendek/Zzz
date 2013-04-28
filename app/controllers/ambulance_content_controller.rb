class AmbulanceContentController < ApplicationController
  def show
    @rating = Rating.find(1)
    @ambulance_item = AmbulanceItem.where(:ambulance_id => params[:id] )

    @ratings = Rating.where(:ambulance_item_id => params[:id])

  end
end
