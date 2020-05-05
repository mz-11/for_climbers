class UserProfile < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_profiles
  end
end
