class AddDeadlineToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :deadline, :string
  end
end
