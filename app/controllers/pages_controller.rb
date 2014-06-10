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

  # def african_american
  #   session[:type] = "african_american"
  #   redirect_to root_path
  # end

  # def white
  #   session[:type] = "white"
  #   redirect_to root_path
  # end

  # def mei
  #   session[:type] = "mei"
  #   redirect_to root_path
  # end

  # def women
  #   session[:type] = "women"
  #   redirect_to root_path
  # end

  # def asian
  #   session[:type] = "asian"
  #   redirect_to root_path
  # end

  # def latino
  #   session[:type] = "latino"
  #   redirect_to root_path
  # end

  def test
  end

  def homescreen
  end


end