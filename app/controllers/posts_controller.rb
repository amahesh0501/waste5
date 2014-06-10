


class PostsController < ApplicationController



  def index
    redirect_to root_path
  end

  def browse
    if session[:type] == "short"
      posts = Post.where("duration < ?", 300)
      @time = "short"
    elsif session[:type] == "medium"
      posts = Post.where("duration < ? AND duration > ?", 1800, 299 )
      @time = "medium length"
    elsif session[:type] == "long"
      posts = Post.where("duration > ?", 1799)
      @time = "long"
    elsif session[:type] == "all"
      posts = Post.all
    else
      posts = Post.all
    end



    @post = posts.sample
    @comedian = Comedian.find(@post.comedian_id) if @post.comedian_id
    @video_id = @post.youtube_id
    @next_post = posts.sample
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end





  def show
    if session[:type] == "short"
      posts = Post.where("duration < ?", 300)
      @time = "short"
    elsif session[:type] == "medium"
      posts = Post.where("duration < ? AND duration > ?", 1800, 299 )
      @time = "medium length"
    elsif session[:type] == "long"
      posts = Post.where("duration > ?", 1799)
      @time = "long"
    elsif session[:type] == "all"
      posts = Post.all
    else
      posts = Post.all
    end

    @post = Post.find(params[:id])
    @comedian = Comedian.find(@post.comedian_id) if @post.comedian_id
    @video_id = @post.youtube_id
    @next_post = Post.find(@post.id + 1)
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end

  def search
    @posts = Post.text_search(params[:query])
  end


  def new
    admin_only
    @post = Post.new
    @create_post = true
    @comedians = Comedian.order("name")

  end

  def create
    admin_only

    require 'rubygems'
    require 'google/api_client'
    require 'trollop'
    require 'youtube_it'

    developer_key = "AIzaSyCE0MVxKIJWDbbcfFBDwqD2PW7Igpo8zwY"
    youtube_api_service_name = "youtube"
    youtube_api_version = "v3"
    client = Google::APIClient.new(:key => developer_key,
                                   :authorization => nil)
    youtube = client.discovered_api(youtube_api_service_name, youtube_api_version)
    yt_client = YouTubeIt::Client.new(:dev_key => developer_key)

    input = params[:post][:youtube_id]
    posts_to_add = input.split(',').map(&:strip)
    posts_to_add.each do |yt_vid_key|
      id = yt_vid_key
      video = yt_client.video_by(id)
      title = video.title
      video.description ? description = video.description : description = ""
      video.uploaded_at ? uploaded_at = video.uploaded_at : uploaded_at = "2000-01-01 01:01:01.000000"
      video.view_count ? view_count = video.view_count : view_count = 0
      video.duration ? duration = video.duration : duration = 0
      image_url = video.thumbnails[2].url
      post = Post.new(youtube_id: yt_vid_key, title: title, description: description, date: uploaded_at, view_count: view_count, duration: duration, comedian_id: params[:post][:comedian_id], image_url: image_url)
      post.save
    end
    redirect_to root_path

    

  end

  def edit
    admin_only
    @post = Post.find(params[:id])
    @comedians = Comedian.order("name")
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
    reports = Report.find_all_by_post_to_report(params[:id])
    reports.each {|report| report.destroy}

    post.destroy



    redirect_to root_path
  end

 

end


