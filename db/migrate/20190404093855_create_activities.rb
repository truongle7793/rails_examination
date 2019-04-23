class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name, null: false, limit: 190

      t.timestamps
    end
    add_index :activities, :name, :unique => true, :name => 'index_activity_name'
  end
end
