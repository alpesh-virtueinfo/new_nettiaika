class AlterCompany < ActiveRecord::Migration
  def change
    change_column :companies, :morning_start_time, :string
    change_column :companies, :evening_end_time, :string
  end
end
