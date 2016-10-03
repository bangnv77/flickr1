class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.column :title, :string
      t.column :email, :string

      t.timestamps
    end
  end
end
