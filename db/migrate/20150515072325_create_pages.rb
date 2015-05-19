class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|

    	t.integer "subject_id"

    	t.string "name"			  # Country
    	t.string "permalink"	# Picture of destination
    	t.integer "position"	# 
    	t.boolean "visible"		# 

      t.timestamps null: false
    end

    add_index("pages", "subject_id")
    add_index("pages", "permalink")

  end
end
