# This migration comes from odania_core_engine (originally 20150308231328)
class CreateOdaniaCategories < ActiveRecord::Migration
	def change
		create_table :odania_categories do |t|
			t.integer :site_id
			t.integer :user_id
			t.integer :language_id
			t.string :title
			t.integer :count
			t.timestamps null: false
		end
	end
end
