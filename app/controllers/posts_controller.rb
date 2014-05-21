class PostsController < ApplicationController



  def index
  end

  def browse
    if session[:type] == "short"
      posts = Post.where("duration < ?", 300)
    elsif session[:type] == "medium"
      posts = Post.where("duration < ? AND duration > ?", 1800, 299 )
    elsif session[:type] == "long"
      posts = Post.where("duration > ?", 1799)
    elsif session[:type] == "african_american"
      posts = Post.where("category = ?", "black" || "black woman")
    elsif session[:type] == "white"
      posts = Post.where("category = ?", "white" || "white woman")
    elsif session[:type] == "mei"
      posts = Post.where("category = ?", "mei" || "mei woman")
    elsif session[:type] == "latino"
      posts = Post.where("category = ?", "latino" || "latino woman")
    elsif session[:type] == "asian"
      posts = Post.where("category = ?", "asian" || "asian woman")
    elsif session[:type] == "all"
      posts = Post.all
    else
      posts = Post.all
    end
    posts = Post.all
    @post = posts.sample
    @video_id = @post.youtube_id
    @next_post = posts.sample
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end





  def show
    if session[:type] == "short"
      posts = Post.where("duration < ?", 300)
    elsif session[:type] == "medium"
      posts = Post.where("duration < ? AND duration > ?", 1800, 299 )
    elsif session[:type] == "long"
      posts = Post.where("duration > ?", 1799)
    elsif session[:type] == "african_american"
      posts = Post.where("category = ?", "black" || "black woman")
    elsif session[:type] == "white"
      posts = Post.where("category = ?", "white" || "white woman")
    elsif session[:type] == "mei"
      posts = Post.where("category = ?", "mei" || "mei woman")
    elsif session[:type] == "latino"
      posts = Post.where("category = ?", "latino" || "latino woman")
    elsif session[:type] == "asian"
      posts = Post.where("category = ?", "asian" || "asian woman")
    elsif session[:type] == "all"
      posts = Post.all
    else
      posts = Post.all
    end

    @post = Post.find(params[:id])
    @video_id = @post.youtube_id
    @next_post = posts.sample
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end

  def search
    @posts = Post.text_search(params[:query])
  end


  def new
  end

  def create
  end

  def edit
    admin_only
    @post = Post.find(params[:id])
  end

  def update
    admin_only
    post = Post.find(params[:id])
    if post.update_attributes(params[:post])
      redirect_to post_path(post)
    else
      flash.now[:errors] = @question.errors.full_messages
      erb :edit
    end
  end

  def destroy
    admin_only
    post = Post.find(params[:id])
    post.destroy

    reports = Report.find_all_by_post_to_report(params[:id])
    reports.each {|report| report.destroy}

    redirect_to admin_path
  end
end


