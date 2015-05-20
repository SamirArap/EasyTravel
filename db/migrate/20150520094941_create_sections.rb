class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

    	t.integer "page_id"

    	t.integer "position"
    	t.string "permalink"
    	t.string "name"
    	t.string "departure"
    	t.string "return"
    	t.decimal "price"
    	t.string "trip"
    	t.string "tip"
    	t.boolean "visible"

      t.timestamps null: false
    end

    add_index("sections", "page_id")
    add_index("sections", "permalink")
  end
end


    
      