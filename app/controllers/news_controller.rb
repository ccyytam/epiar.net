class NewsController < ApplicationController
  def index
    #@news = News.all :limit => 4, :order => "posted DESC"
    @news = News.page(params[:page]).order('posted DESC')

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @article = News.find_by_slug(params[:slug])
    
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
