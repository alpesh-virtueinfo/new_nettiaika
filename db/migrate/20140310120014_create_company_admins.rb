class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|
      t.integer :company_id
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :fax
      t.integer :sort_order

      t.timestamps
    end
  end
end
