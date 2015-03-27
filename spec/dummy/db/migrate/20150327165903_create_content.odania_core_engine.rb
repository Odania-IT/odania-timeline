# This migration comes from odania_core_engine (originally 20140313225260)
class CreateContent < ActiveRecord::Migration
	def change
		create_table :odania_contents do |t|
			t.string :title, null: false
			t.text :body, null: false
			t.text :body_filtered, null: false
			t.text :body_short, null: false
			t.integer :clicks, default: 0
			t.integer :views, default: 0
			t.datetime :published_at, null: false
			t.boolean :is_active, default: false
			t.integer :site_id, null: false
			t.integer :language_id, null: false
			t.integer :user_id, null: false
			t.timestamps null: false
		end

		add_index :odania_contents, [:site_id, :language_id, :is_active]
		add_index :odania_contents, [:user_id]
	end
end
