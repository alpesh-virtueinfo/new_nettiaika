class Admin::PaymentTypesController < ApplicationController
  before_filter :get_payment_params, :only => [:edit, :show, :update, :destroy]
  helper_method :sort_column, :sort_direction
  
  # GET /payment_types list action
  def index
    session[:search_params] = params[:payment_type] ? params[:payment_type] : nil
    session[:set_pager_number] = params[:set_pager_number] if params[:set_pager_number]

    if session[:set_pager_number].nil?
      session[:set_pager_number] = PER_PAGE
    end
    
    @payment_types = PaymentType.all
      .search(session[:search_params])
      .order(sort_column + " " + sort_direction)
      .paginate(:per_page => session[:set_pager_number], :page => params[:page])
    @params_arr = ['payment_method']
  end

  # GET /payment_types/1/edit
  def new
    @payment_type = PaymentType.new
    @companies = Company.all
  end
  
  # POST /payment_types
  def create
    
    @payment_type = PaymentType.new(payment_params)
    @companies = Company.all
    respond_to do |format|
      if @payment_type.save
        format.html { redirect_to admin_payment_types_url, notice: t("general.successfully_created") }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /payment_types/1/edit
  def edit
    @p_status = @payment_type ? true : false
  end
  
  # PATCH/PUT /payment_types/1
  def update
    respond_to do |format|
      if @payment_type.update_attributes(payment_params)
        format.html { redirect_to admin_payment_types_url, notice: t("general.successfully_updated") }
      else
        format.html { render action: 'edit' }
      end
    end
  end
 
  # GET /payment_types/1
  def show
  end
  
  # DELETE /payment_types/1
  def destroy
    @payment_type.destroy
    redirect_to admin_payment_types_path
  end

  private

  def get_payment_params
    @payment_type = PaymentType.find(params[:id])
    @companies = Company.all
  end

  def payment_params
    params[:payment_type][:exact_charge] = params[:payment_type][:exact_charge] == '0' ? 1 : 0
    params.require(:payment_type).permit!
  end
  
  def sort_column
    PaymentType.column_names.include?(params[:sort]) ? params[:sort] : "id"  
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
