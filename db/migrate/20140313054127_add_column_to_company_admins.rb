class AddColumnToCompanyAdmins < ActiveRecord::Migration
  def change
    add_column :company_admins,:password_salt,:string, :null => true
    add_column :company_admins,:persistence_token,:string, :null => true

  end
end
