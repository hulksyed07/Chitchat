class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name,:string
      t.column :gender,:string
      t.column :created_at,:timestamp
    end
  end
end
