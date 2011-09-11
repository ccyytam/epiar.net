class News < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 4
  
  belongs_to :user
  
  def to_param
    slug
  end
  
  def link
    { :controller => "news", :action => "show", :year => created_at.year, :month => created_at.month, :day => created_at.day, :id => slug }
  end
end
