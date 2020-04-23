class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :image
      t.string :gym_name
      t.string :grade
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
