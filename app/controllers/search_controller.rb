class SearchController < ApplicationController
  # NOTE: To make search functionality publicly accessible
  skip_before_action :authenticate_user!

  def index
    if params[:search].present?
      @parcels = Parcel.where(id: params[:search])
    else
      @parcels = []
    end
  end
end
