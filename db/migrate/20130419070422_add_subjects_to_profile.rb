class AddSubjectsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :subjects, :string
  end
end
