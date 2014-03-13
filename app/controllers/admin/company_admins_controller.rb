class Admin::CompanyAdminsController < ApplicationController
  before_filter :get_company_admin_from_params, :only => [:edit, :show, :update, :destroy]
  def index
    @company_admins = CompanyAdmin.all.paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['username', 'first_name']
  end

  def new
    @company_admin = CompanyAdmin.new
    @companies = Company.all
  end

  def create
    @company_admin = CompanyAdmin.new(company_admin_params)
    @companies = Company.all
    respond_to do |format|
      if @company_admin.save
        format.html { redirect_to admin_company_admins_path, notice: t("general.successfully_created") }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @company_admin.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end

  def edit
    @companies = Company.all
  end

  def update
    @companies = Company.all
    #render :text => params.inspect and return false
    respond_to do |format|
      if @company_admin.update_attributes(company_admin_params)
        format.html { redirect_to admin_company_admins_path, notice: t("general.successfully_updated") }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company_admin.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @company_admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_company_admins_path, notice: t("general.successfully_destroyed") }
    end
  end

  private

  def get_company_admin_from_params
    @company_admin = CompanyAdmin.find(params[:id])
  end

  def company_admin_params
    #(:company_id, :username, :password, :first_name, :last_name, :email, :phone, :mobile, :fax, :sort_order,:password_confirmation)
    params.require(:company_admin).permit!
  end


end
