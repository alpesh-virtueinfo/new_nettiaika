class CompanyLanguage < ActiveRecord::Base
  belongs_to :company
  belongs_to :language

  scope :editable_languages, ->(default_language_id) { where.not(language_id: default_language_id)}
end

