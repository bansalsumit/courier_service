class ReportsController < ApplicationController
  before_action :is_admin?

  # NOTE: Added new tab to see all reports and only accessible via admin user only
  def index
    @reports = Report.all
  end

  private

  # it will call before every action on this controller
  def is_admin?
    # check if user is a admin
    # if not admin then redirect to root path
    redirect_to root_path unless current_user.admin?
  end
end
