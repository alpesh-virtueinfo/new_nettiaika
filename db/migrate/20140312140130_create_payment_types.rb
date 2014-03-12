class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :payment_method
      t.string :payment_class
      t.string :payment_receiver
      t.string :client_number
      t.boolean :exact_charge
      t.boolean :is_case
      t.integer :sort_order
      t.string :status, limit: 1

      t.timestamps
    end
  end
end
