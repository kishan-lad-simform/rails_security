class BankDetailsController < ApplicationController
  before_action :require_login
  
  def index
    @details = BankDetail
      .select(:id, :credit_card_number)
      .where(" user_id = ?", @current_user.id)
  end

  def new
    @detail = @current_user.bank_details.build
  end

  def create
    @detail = @current_user
      .bank_details 
      .build(get_card_params)

    if @detail.save
      redirect_to user_bank_details_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @detail = BankDetail.find(params[:id])
    @detail.destroy
    redirect_to user_bank_details_path
  end

  private
    def get_card_params
      params.require(:bank_detail)
        .permit( 
          :cvv_number, 
          :credit_card_number, 
          :password 
        )
    end
end
