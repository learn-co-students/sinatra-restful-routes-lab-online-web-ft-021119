class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.text :name
      t.string :ingredients
      t.text :cook_time
    end
  end
  def down
    drop_table :recipes
  end
end
