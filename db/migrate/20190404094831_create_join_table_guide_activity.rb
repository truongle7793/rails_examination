class CreateJoinTableGuideActivity < ActiveRecord::Migration[5.2]
  def change
    create_join_table :guides, :activities do |t|
      t.references :guide, index: true, null: false, foreign_key: true
      t.references :activity, index: true, null: false, foreign_key: true

      t.index [:guide_id, :activity_id]
      t.index [:activity_id, :guide_id]
    end
  end
end
