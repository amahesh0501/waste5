class ComediansController < ApplicationController

  def index
    @comedians = []
    @all_comedians = Comedian.all
    @all_comedians.each {|comedian| @comedians << comedian if comedian.posts.length > 7}
  end

  def show
    @comedian = Comedian.find(params[:id])
    @posts = @comedian.posts
  end

  def new
    admin_only
    @comedian = Comedian.new
  end

  def create
    admin_only
    @comedian = Comedian.new(params[:comedian])
    if @comedian.save
      redirect_to comedian_path(@comedian)
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
    @comedian = Comedian.find(params[:id])
    @comedian.name = params[:comedian][:name]
    @comedian.save
    redirect_to comedian_path(@comedian)
  end

  def destroy
    admin_only
    comedian = Comedian.find(params[:id])
    if comedian.posts.length == 0
      comedian.destroy
      redirect_to admin_path
    else
      redirect_to comedian_path(comedian)
    end
  end


  def all_comedians
    @comedians = []
    @all_comedians = Comedian.all
    @all_comedians.each {|comedian| @comedians << comedian if comedian.posts.length > 0}
    @comedians = @comedians.group_by{|u| u.name[0]}
  end


end