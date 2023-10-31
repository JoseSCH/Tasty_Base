class CreateUserLists < ActiveRecord::Migration[7.1]
  def change
    create_table :user_lists do |t|
      t.string :idMeal
      t.string :recipe_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
