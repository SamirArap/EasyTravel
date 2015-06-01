class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

    	t.integer "category_id"
    	t.string "name"

      t.timestamps null: false
    end

    add_index("categories", "category_id")
  end
end
