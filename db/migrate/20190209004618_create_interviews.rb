class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references :user, foreign_key: true
      t.references :interviewer
      t.datetime :begin_at
      t.integer :allowed

      t.timestamps
    end
    add_foreign_key :interviews, :users, column: :interviewer_id
  end
end
