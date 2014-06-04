class ReportsController < ApplicationController


  def report
    Report.create(post_to_report: params[:post_to_report])
    redirect_to root_path
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to admin_path
  end


end