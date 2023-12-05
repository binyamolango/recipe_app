class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.decimal :preparation_time, precision: 5, scale: 2
      t.decimal :cooking_time, precision: 5, scale: 2
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
