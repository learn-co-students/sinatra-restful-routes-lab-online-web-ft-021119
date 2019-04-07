class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |element|
      element.string :name
      element.string :ingredients
      element.string :cook_time
    end
  end
end
