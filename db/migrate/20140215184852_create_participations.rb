class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :user, index: true
      t.references :idea, index: true

      t.timestamps
    end
  end
end
