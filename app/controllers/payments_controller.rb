class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :destroy]

  def index
    @payments = Payment.all.page(params[:page])
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      gflash success: "Payments was successfully created."
      redirect_to root_path
    else
      gflash :now, error: @payment.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def destroy
    @payment.destroy
    gflash success: 'Payment was successfully destroyed.'
    redirect_to root_path
  end


private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit!
  end

end
