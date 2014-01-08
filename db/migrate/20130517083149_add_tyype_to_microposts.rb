class AddTyypeToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :tyype, :string
  end
end
