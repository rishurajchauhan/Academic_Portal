class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :research
      t.string :current_students
      t.string :collaborators
      t.string :journals
      t.string :conferences
      t.string :books
      t.string :monogram
      t.integer :user_id

      t.timestamps
    end
    add_index :profiles, [:user_id, :created_at]
  end
end
