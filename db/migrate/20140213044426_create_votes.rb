class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_up, default: false
      t.references :user, index: true
      t.references :idea, index: true

      t.timestamps
    end
  end
end
