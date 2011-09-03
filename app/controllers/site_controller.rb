class SiteController < ApplicationController
  
  def index
    @news = News.all :limit => 4, :order => "posted DESC"
    
    respond_to do |format|
      format.html
    end
  end

  def archive
  end

  def download
  end

  def contact
  end

end
