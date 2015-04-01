class AddDateColumn < ActiveRecord::Migration
	def change
		rename_column :odania_timeline_timeline_contents, :timeline_date, :from_date
		add_column :odania_timeline_timeline_contents, :to_date, :date
	end
end
