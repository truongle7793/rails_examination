class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :guide, foreign_key: true, index: true
      t.integer :score, null: false, limit: 1
      t.text :comment

      t.timestamps
    end

    # add_reference :reviews, :guide, index: true, foreign_key: true
  end
end
