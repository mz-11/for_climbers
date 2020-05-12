class ChangeDataCategoryToEvaluations < ActiveRecord::Migration[5.2]
  def change
     change_column :evaluations, :category, :string
  end
end
