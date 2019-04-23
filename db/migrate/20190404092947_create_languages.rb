class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :code, null: false, limit: 25

      t.timestamps
    end
    add_index :languages, :code, :unique => true, :name => 'index_language_code'
  end
end
