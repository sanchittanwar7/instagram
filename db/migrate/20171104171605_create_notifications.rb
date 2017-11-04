class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :receiver_id
      t.integer :actor_id
      t.string :statement
      t.boolean :read
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
