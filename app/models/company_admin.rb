class CompanyAdmin < ActiveRecord::Base
  belongs_to :company
  
  validates :company_id, :username, :first_name, :email, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  include SearchHandler
  
  acts_as_authentic do |c|
    c.validate_email_field = false
    c.login_field = 'email'
  end

end
