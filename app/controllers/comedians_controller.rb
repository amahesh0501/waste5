class ComediansController < ApplicationController

  def index
    @comedians = []
    @all_comedians = Comedian.all
    @all_comedians.each {|comedian| @comedians << comedian if comedian.posts.length > 0}

    @comedians = @comedians.group_by{|u| u.name[0]}
  end

  def show
    @comedian = Comedian.find(params[:id])
    posts = @comedian.posts
    @post = posts.sample
    @video_id = @post.youtube_id
    @next_post = posts.sample
    params[:autoplay] ? @autoplay = 1 : @autoplay = 0
  end

  def new
    admin_only
    @comedian = Comedian.new
  end

  def create
    admin_only
    @comedian = Comedian.new(params[:comedian])
    if @comedian.save
      redirect_to admin_path
    else
      flash.now[:errors] = @comedian.errors.full_messages
      render :new
    end
  end

  def edit
    admin_only
    @comedian = Comedian.find(params[:id])
  end

  def update
    admin_only
  end

  def destroy
    admin_only
    comedian = Comedian.find(params[:id])
    posts = comedian.posts
    posts.each do |post|
      default_comedian = Comedian.find_by_name("_no_name")
      post.comedian_id = default_comedian.id
      post.save
    end
    comedian.destroy


    redirect_to admin_path
  end


end