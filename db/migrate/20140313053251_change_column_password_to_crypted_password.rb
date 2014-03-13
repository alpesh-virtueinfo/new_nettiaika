class ChangeColumnPasswordToCryptedPassword < ActiveRecord::Migration
  def change
    rename_column :company_admins, :password, :crypted_password
  end
end
