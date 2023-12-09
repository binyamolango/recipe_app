class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.decimal :preparation_time, precision: 5, scale: 2
      t.decimal :cooking_time, precision: 5, scale: 2
      t.boolean :public, default: true

      t.timestamps
    end

    add_index :recipes, :name, unique: true
    add_reference :recipes, :user, null: false, foreign_key: { on_delete: :cascade }
  end
end
