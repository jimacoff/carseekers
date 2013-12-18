require 'will_paginate/array'

class SearchesController < ApplicationController
  def index
    @results = Ad.active
    @results = @results.with_model(search_params[:model_id])
    @results = @results.by_fuel(search_params[:fuel_type]) unless search_params[:fuel_type].empty?
    @results = @results.by_engine(search_params[:engine]) unless search_params[:engine].empty?
    @results = @results.by_age(search_params[:age]) unless search_params[:age].empty?
    @results = @results.by_hp(search_params[:hp]) unless search_params[:hp].empty?
    @results = @results.by_style(search_params[:style]) unless search_params[:style].empty?
    @results = @results.by_color(search_params[:color]) unless search_params[:color].empty?
    respond_to do |format|
      format.js do
        @results = @results.near(search_params[:postcode])
        render :json => @results
      end
      format.html do
        @ads = @results.paginate(:page => params[:page], :per_page => 5)
        @title = "Search Results"
        render 'ads/index', :locals => { :ads => @ads, :title => @title }
      end
    end
  end

  private
  def search_params
    params.require(:search).permit(:postcode, :make_id, :model_id, :fuel_type, :engine, :hp, :style, :color, :age)
  end
end
