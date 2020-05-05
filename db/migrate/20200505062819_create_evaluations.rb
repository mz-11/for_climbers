class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :category_id
      t.integer :point

      t.timestamps
    end
  end
end
