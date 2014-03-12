class Admin::CompaniesController < ApplicationController
  before_filter :get_company_from_params, :only => [:show, :edit, :update, :destroy, :update_company_language, :edit_language,:update_language]
  helper_method :sort_column, :sort_direction
  
  # GET /companise list action
  def index
    @companies = Company.all.
        search(session[:search_params]).
        order(sort_column + " " + sort_direction).
        paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['name']
  end

  # GET /companise/1/edit
  def new
    @company = Company.new
  end

  # POST /companise
  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to admin_companies_url, notice: t("general.successfully_created") }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /companise/1
  def show
  end

  # GET /companise/1/edit
  def edit
  end
  
  # PATCH/PUT /companise/1
  def update
    respond_to do |format|
      if @company.update_attributes(company_params)
        format.html { redirect_to admin_companies_url, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /companise/1
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: t("general.successfully_destroyed") }
    end
  end
  
  def language_list
    @companies = Company.all
    @languages = Language.all
  end

  def edit_language
    @languages = Language.all
  end

  def update_language
    default_language = Language.find_by_code('en')
    company_languages = @company.company_languages.editable_languages(default_language.id)
    company_languages.update_all activate: false
    if params[:company_language].present?
      params[:company_language].each do |language_id|
        if !(@company.company_languages.pluck(:language_id).include?(language_id.to_i))
          CompanyLanguage.create({company_id: @company.id, language_id: language_id, activate: true})
        else
          @company.company_languages.find_by_language_id(language_id).update_attribute('activate', true)
        end
      end
    end
    redirect_to admin_language_list_path
  end


  private
  
  def get_company_from_params
    @company  = Company.find(params[:id])
  end
  
  def company_params
    params[:company][:morning_start_time] = params[:morning_stime] + ':' + params[:morning_etime]
    params[:company][:evening_end_time] = params[:evening_stime] + ':' + params[:evening_etime]
    #:name, :business_id, :address, :zip, :city, :contact_person, :contact_email, :sender_email, :contact_phone, :contact_fax, :url, :mob_url, :default_reservation_time, :schedule_time_interval, :weekdays, :release_day, :release_vip_day, :reservation_time_limit, :regular_reservation_limit, :unregular_reservation_limit, :agent_interval, :max_real_length, :real_length_slot, :home_display, :appointment_free, :sort_order, :purpose_length_disp, :c_e_appointment_limit, :week_of_month, :agent_run, :num_tab, :display_tab_name, :logo_link, :logo_image, :company_logo, :company_banner, :secondary_logo_image, :secondary_url, :update_url, :send_email, :send_sms, :forenoon_start, :forenoon_end, :afternoon_start, :afternoon_end, :morning_start_time, :evening_end_time, :close, :appConfirm, :reason_text, :display_receipt, :display_checkin, :is_def_cashReg, :display_reserve_btn, :mail_format, :massmail, :massmail_internal, :appoinment_reservation_day, :address_on_receipt, :toplogo_link, :comlogo_link, :combanner_link, :default_logo_display, :web_id_login, :green_box, :display_cal
    params.require(:company).permit!
  end
  
  def sort_column
    Company.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
