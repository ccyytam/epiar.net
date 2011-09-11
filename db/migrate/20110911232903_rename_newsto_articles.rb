class RenameNewstoArticles < ActiveRecord::Migration
  def up
    rename_table :news, :articles
  end

  def down
    rename_table :articles, :news
  end
end
