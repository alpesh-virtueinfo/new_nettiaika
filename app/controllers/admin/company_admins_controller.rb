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
    @company_admin.save
    redirect_to admin_company_admins_path
  end


  def show
  end

  def edit
    @companies = Company.all
  end

  def update
    @company_admin.update_attributes(company_admin_params)
    redirect_to admin_company_admins_path
  end

  def destroy
    @company_admin.destroy
    redirect_to admin_company_admins_path
  end

  private

  def get_company_admin_from_params
    @company_admin = CompanyAdmin.find(params[:id])
  end

  def company_admin_params
    params.require(:company_admin).permit(:company_id, :username, :password, :first_name, :last_name, :email, :phone, :mobile, :fax, :sort_order)
  end

end
