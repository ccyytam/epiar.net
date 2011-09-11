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
    @article = News.find_by_slug(params[:slug])
  end

  def update
    @article = News.find_by_slug(params[:slug])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = News.find_by_slug(params[:slug])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(news_url) }
    end
  end

  # GET /news/new
  def new
    @article = News.new

    respond_to do |format|
      format.html
    end
  end
  
  # POST /groups
  def create
    @article = News.new(params[:article])
    
    debugger
    
    @article.slug = @article.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
