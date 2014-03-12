class Language < ActiveRecord::Base
  has_many :company_languages

  include SearchHandler
  validates :name, :code, :presence => true
end
