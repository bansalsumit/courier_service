class ApplicationController < ActionController::Base
  # NOTE: To authorize user before accession the portal
  before_action :authenticate_user!
end
