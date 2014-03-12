class Company < ActiveRecord::Base
  has_many :company_admins
  has_many :company_languages
  validates :name, :business_id, :url, :contact_person, :contact_email, :presence => true
  validates :name, uniqueness: true
  validates :url, uniqueness: true
  validates_format_of :contact_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  include SearchHandler
  
  mount_uploader :company_logo, ImageUploader
  mount_uploader :company_banner, ImageUploader
end
