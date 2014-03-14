class Admin::CompanyAdminsController < ApplicationController
  before_filter :get_company_admin_from_params, :only => [:edit, :show, :update, :destroy]
  helper_method :sort_column, :sort_direction
  def index
    session[:search_params] = params[:company_admin] ? params[:company_admin] : nil
    session[:set_pager_number] = params[:set_pager_number] if params[:set_pager_number]

    if session[:set_pager_number].nil?
      session[:set_pager_number] = PER_PAGE
    end
   
    @company_admins = CompanyAdmin.all
      .search(session[:search_params])
      .order(sort_column + " " + sort_direction)
      .paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['first_name', 'last_name']
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
 
  def sort_column
    CompanyAdmin.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
