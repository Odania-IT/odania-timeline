# This migration comes from odania_core_engine (originally 20140313225262)
class CreateMenu < ActiveRecord::Migration
	def change
		create_table :odania_menus do |t|
			t.string :title
			t.boolean :published
			t.integer :default_menu_item_id
			t.integer :site_id
			t.integer :language_id
			t.timestamps null: false
		end

		add_index :odania_menus, [:site_id, :language_id], unique: true
	end
end
