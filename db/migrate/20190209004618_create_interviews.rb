class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.string :user
      t.string :interviewer
      t.datetime :begin_at
      t.integer :allowed

      t.timestamps
    end
  end
end
