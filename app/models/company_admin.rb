class CompanyAdmin < ActiveRecord::Base
  belongs_to :company
  
  include SearchHandler
  
  acts_as_authentic do |c|
    c.validate_email_field = false
    c.login_field = 'email'
  end

end
