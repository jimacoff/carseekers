class RatingsController < ApplicationController

  def create
    @rating = Rating.create(rating_params)
    render :json => { :rating => "trigger" }
  end

  private
  def rating_params
    params.require(:rating).permit(:rateable_id, :rateable_type, :rate, :comment)
  end

end
