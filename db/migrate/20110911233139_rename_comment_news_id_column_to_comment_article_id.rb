class RenameCommentNewsIdColumnToCommentArticleId < ActiveRecord::Migration
  def up
    rename_column :comments, :news_id, :article_id
  end

  def down
    rename_column :comments, :article_id, :news_id
  end
end
