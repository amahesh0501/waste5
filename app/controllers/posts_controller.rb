class PostsController < ApplicationController



  def index
  end

  def show
    posts = Post.all
    @video_id = posts.sample.youtube_id
    @next_post = posts.sample
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end