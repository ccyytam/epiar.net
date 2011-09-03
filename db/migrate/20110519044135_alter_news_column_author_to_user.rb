class AlterNewsColumnAuthorToUser < ActiveRecord::Migration
  def self.up
    rename_column :news, :author, :user_id
  end

  def self.down
    rename_column :news, :user_id, :author
  end
end
