class ReportsController < ApplicationController


  def report
    Report.create(post_to_report: params[:post_to_report])

    if params[:comedian_id]
      comedian = Comedian.find(params[:comedian_id])
      posts = comedian.posts
      redirect_to comedian_path(comedian)
    else
      if session[:type] == "short"
        posts = Post.where("duration < ?", 300)
        @time = "short"
      elsif session[:type] == "medium"
        posts = Post.where("duration < ? AND duration > ?", 1800, 299 )
        @time = "medium"
      elsif session[:type] == "long"
        posts = Post.where("duration > ?", 1799)
        @time = "long"
      elsif session[:type] == "all"
        posts = Post.all
      else
        posts = Post.all
      end
      @next_post = posts.sample
      redirect_to post_path(@next_post)
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to admin_path
  end

  def reportsgoboom
    reports = Report.all
    reports.each {|report| report.destroy }
    redirect_to admin_path

  end


end