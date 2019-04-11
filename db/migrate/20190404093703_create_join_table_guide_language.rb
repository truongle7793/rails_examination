class CreateJoinTableGuideLanguage < ActiveRecord::Migration[5.2]
  def change
    create_join_table :guides, :languages do |t|
      t.references :guide, index: true, null: false, foreign_key: true
      t.references :language, index: true, null: false, foreign_key: true

      t.index [:guide_id, :language_id]
      t.index [:language_id, :guide_id]
    end
  end
end
