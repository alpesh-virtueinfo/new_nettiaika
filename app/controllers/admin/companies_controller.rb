class Admin::CompaniesController < ApplicationController
  before_filter :get_company_from_params, :only => [:show]
    helper_method :sort_column, :sort_direction
  
  def index
    @companies = Company.all.
        search(session[:search_params]).
        order(sort_column + " " + sort_direction).
        paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['name']
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        format.html { redirect_to admin_companies_url, notice: t("general.successfully_created") }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        flash[:error] = "Name / Url / Contact person required"
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
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
  
  def destroy
    @o_single.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: t("general.successfully_destroyed") }
      format.json { head :no_content }
    end
  end
  
  private
  
  def get_company_from_params
    @comapny  = Company.find(params[:id])
  end
  
  def company_params
    params[:company][:morning_start_time] = params[:morning_stime] + ':' + params[:morning_etime]
    params[:company][:evening_end_time] = params[:evening_stime] + ':' + params[:evening_etime]
    params.require(:company).permit(:name, :business_id, :address, :zip, :city, :contact_person, :contact_email, :sender_email, :contact_phone, :contact_fax, :url, :mob_url, :default_reservation_time, :schedule_time_interval, :weekdays, :release_day, :release_vip_day, :reservation_time_limit, :regular_reservation_limit, :unregular_reservation_limit, :agent_interval, :max_real_length, :real_length_slot, :home_display, :appointment_free, :sort_order, :purpose_length_disp, :c_e_appointment_limit, :week_of_month, :agent_run, :num_tab, :display_tab_name, :logo_link, :logo_image, :company_logo, :company_banner, :secondary_logo_image, :secondary_url, :update_url, :send_email, :send_sms, :forenoon_start, :forenoon_end, :afternoon_start, :afternoon_end, :morning_start_time, :evening_end_time, :close, :appConfirm, :reason_text, :display_receipt, :display_checkin, :is_def_cashReg, :display_reserve_btn, :mail_format, :massmail, :massmail_internal, :appoinment_reservation_day, :address_on_receipt, :toplogo_link, :comlogo_link, :combanner_link, :default_logo_display, :web_id_login, :green_box, :display_cal)
  end
  
  def sort_column
    Company.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  
end
