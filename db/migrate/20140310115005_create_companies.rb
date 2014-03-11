class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :business_id
      t.text :address
      t.string :zip
      t.string :city
      t.string :contact_person
      t.string :contact_email
      t.string :sender_email
      t.string :contact_phone
      t.string :contact_fax
      t.string :url
      t.string :mob_url
      t.integer :default_reservation_time
      t.integer :schedule_time_interval
      t.string :weekdays, limit: 1
      t.integer :release_day
      t.integer :release_vip_day
      t.integer :reservation_time_limit
      t.integer :regular_reservation_limit
      t.integer :unregular_reservation_limit
      t.integer :agent_interval
      t.integer :max_real_length
      t.integer :real_length_slot
      t.string :home_display, limit: 1
      t.integer :appointment_free
      t.integer :sort_order
      t.string :purpose_length_disp, limit: 1
      t.string :c_e_appointment_limit
      t.integer :week_of_month
      t.string :agent_run, limit: 1
      t.integer :num_tab
      t.string :display_tab_name, limit: 1
      t.string :logo_link
      t.string :logo_image
      t.string :company_logo
      t.string :company_banner
      t.string :secondary_logo_image
      t.string :secondary_url
      t.string :update_url
      t.string :send_email, limit: 1
      t.string :send_sms, limit: 1
      t.string :forenoon_start
      t.string :forenoon_end
      t.string :afternoon_start
      t.string :afternoon_end
      t.integer :morning_start_time
      t.integer :evening_end_time
      t.string :close, limit: 1
      t.string :appConfirm, limit: 1
      t.string :reason_text
      t.string :display_receipt, limit: 1
      t.string :display_checkin, limit: 1
      t.string :is_def_cashReg, limit: 1
      t.boolean :display_reserve_btn
      t.string :mail_format
      t.string :massmail, limit: 1
      t.string :massmail_internal, limit: 1
      t.integer :appoinment_reservation_day
      t.boolean :address_on_receipt
      t.string :toplogo_link
      t.string :comlogo_link
      t.string :combanner_link
      t.boolean :default_logo_display
      t.boolean :web_id_login
      t.string :green_box, limit: 1
      t.string :display_cal, limit: 1

      t.timestamps
    end
  end
end
