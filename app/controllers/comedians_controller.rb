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
    @comedian = Comedian.new
  end

  def create
    @comedian = Comedian.new(params[:question])
    if @question.save
    @user.questions << @question
    redirect_to city_question_path(@city, @question)
    else
    flash.now[:errors] = @question.errors.full_messages
    render :new
    end
  end


end