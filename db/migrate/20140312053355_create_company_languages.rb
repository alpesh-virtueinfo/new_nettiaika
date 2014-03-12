class CreateCompanyLanguages < ActiveRecord::Migration
  def change
    create_table :company_languages do |t|
      t.integer :company_id
      t.integer :language_id
      t.boolean :activate

      t.timestamps
    end
  end
end
