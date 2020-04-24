class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name 
      t.string :ingredient_name 
      t.string :option_image
      t.integer :measurement

      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
