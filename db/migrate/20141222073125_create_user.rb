class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :provider, :string
      t.column :uid, :string
      t.column :name, :string
      t.column :email, :string
      t.column :image, :string

      t.timestamps
    end
  end
end
