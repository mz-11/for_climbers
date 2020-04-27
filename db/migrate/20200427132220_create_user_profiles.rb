class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :user_id
      t.string :profile_image
      t.string :height
      t.string :weight
      t.string :usually_grade

      t.timestamps

    end
  end
end
