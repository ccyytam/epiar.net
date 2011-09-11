class News < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 4
  
  belongs_to :user
  
  def to_param
    slug
  end
end
