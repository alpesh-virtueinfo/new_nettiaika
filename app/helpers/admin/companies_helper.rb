module Admin::CompaniesHelper
  def is_selected_company_language?(company,language)
    company_languages = company.company_languages.find_by_language_id(language.id)
    if company_languages.present?
      return company_languages.activate
    else
      false
    end
  end
end

