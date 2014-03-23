class ReportsController < ApplicationController



  def report
    Report.create(post_to_report: params[:post_to_report])
    redirect_to root_path
  end


end