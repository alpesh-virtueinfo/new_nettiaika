class Company < ActiveRecord::Base
  has_many :company_admins
  validates :name, :url, :contact_person, :presence => true
  
  include SearchHandler
  mount_uploader :company_logo, ImageUploader
  mount_uploader :company_banner, ImageUploader
end
