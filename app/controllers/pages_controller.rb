class PagesController < ApplicationController
  def index
  end

  def admin
    admin_only
    @reports = Report.all
    @comedians = Comedian.order("name")
    comedian = Comedian.find_by_name("_no_name")
    @no_comedian_posts = comedian.posts

    @posts = Post.all
    @total_time = 0
    @posts.each {|post| @total_time += post.duration}
    @hours = @total_time/3600.to_f




  end

  def all
    session[:type] = "all"
    redirect_to root_path
  end

  def short
    session[:type] = "short"
    redirect_to root_path
  end

  def medium
    session[:type] = "medium"
    redirect_to root_path
  end

  def long
    session[:type] = "long"
    redirect_to root_path
  end

  def show_video_list
    @posts = Post.all.sample(100)
  end

  def homescreen
  end


end