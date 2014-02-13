class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :description
      t.string :status
      t.integer :vote_score
      t.integer :hit_counter
      t.references :user, index: true

      t.timestamps
    end
  end
end
