class ArticlesController < ApplicationController
  before_filter :load_article
  filter_access_to :all, :attribute_check => true
  
  def index
    @article = Article.page(params[:page]).order('posted DESC')

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @article = Article.find_by_slug(params[:id])
  end

  def update
    @article = Article.find_by_slug(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:news])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find_by_slug(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(news_url) }
    end
  end

  # GET /news/new
  def new
    @article = Article.new

    respond_to do |format|
      format.html
    end
  end
  
  def create
    @article = Article.new(params[:news])
    
    @article.slug = @article.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  protected
  
  def load_article
    @article = Article.find_by_slug(params[:id])
  end
end
