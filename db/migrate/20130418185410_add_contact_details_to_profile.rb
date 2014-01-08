class AddContactDetailsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :ph, :string
    add_column :profiles, :cabin, :integer
    add_column :profiles, :post, :string
  end
end
