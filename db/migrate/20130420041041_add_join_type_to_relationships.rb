class AddJoinTypeToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :join_type, :string
  end
end
