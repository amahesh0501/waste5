class PagesController < ApplicationController
  def index
  end

  def admin
    admin_only
    @reports = Report.all
    @comedians = Comedian.order("name")
    comedian = Comedian.find_by_name("_no_name")
    @no_comedian_posts = comedian.posts
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

  def african_american
    session[:type] = "african_american"
    redirect_to root_path
  end

  def white
    session[:type] = "white"
    redirect_to root_path
  end

  def mei
    session[:type] = "mei"
    redirect_to root_path
  end

  def women
    session[:type] = "women"
    redirect_to root_path
  end

  def asian
    session[:type] = "asian"
    redirect_to root_path
  end

  def latino
    session[:type] = "latino"
    redirect_to root_path
  end


end