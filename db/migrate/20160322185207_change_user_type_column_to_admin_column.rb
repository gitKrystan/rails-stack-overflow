class ChangeUserTypeColumnToAdminColumn < ActiveRecord::Migration
  def change
    remove_column(:users, :type, :string)
    add_column(:users, :admin, :boolean, default: false)
  end
end
