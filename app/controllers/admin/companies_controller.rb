class Admin::CompaniesController < ApplicationController
  before_filter :get_company_from_params, :only => [:show, :edit]
  
  def index
    @companies = Company.all.paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['name']
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.save
    redirect_to companies_path
    #render :text => params.inspect and return false
  end

  def show
  end

  def edit
  end

  def update
    @company = Company.new
  end

  
  def get_company_from_params
    @comapny  = Company.find(params[:id])
  end
  
  private
  
  def company_params
    params.require(:company).permit(:name, :business_id, :address, :zip, :city, :contact_person, :contact_email, :sender_email, :contact_phone, :contact_fax, :url, :mob_url, :default_reservation_time, :schedule_time_interval, :weekdays, :release_day, :release_vip_day, :reservation_time_limit, :regular_reservation_limit, :unregular_reservation_limit, :agent_interval, :max_real_length, :real_length_slot, :home_display, :appointment_free, :sort_order, :purpose_length_disp, :c_e_appointment_limit, :week_of_month, :agent_run, :num_tab, :display_tab_name, :logo_link, :logo_image, :company_logo, :company_banner, :secondary_logo_image, :secondary_url, :update_url, :send_email, :send_sms, :forenoon_start, :forenoon_end, :afternoon_start, :afternoon_end, :morning_start_time, :evening_end_time, :close, :appConfirm, :reason_text, :display_receipt, :display_checkin, :is_def_cashReg, :display_reserve_btn, :mail_format, :massmail, :massmail_internal, :appoinment_reservation_day, :address_on_receipt, :toplogo_link, :comlogo_link, :combanner_link, :default_logo_display, :web_id_login, :green_box, :display_cal)
  end
end
