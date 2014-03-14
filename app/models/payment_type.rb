class PaymentType < ActiveRecord::Base
  belongs_to :company
  validates :payment_method, :company_id, :presence => true
  
  include SearchHandler
end
