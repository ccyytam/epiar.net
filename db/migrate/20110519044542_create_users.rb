class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :role
      t.string :email
      t.datetime :joined

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
