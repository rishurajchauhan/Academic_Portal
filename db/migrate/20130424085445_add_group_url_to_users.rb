class AddGroupUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_url, :string
  end
end
