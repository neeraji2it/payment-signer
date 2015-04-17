class PaymentsController < ApplicationController
  before_action :payment, only: [:payment_pdf, :show, :destroy, :next_step, :thankyou]
  before_action :verify_token, only: [:show, :payment_pdf]

  skip_before_filter :authenticate_user!, only: [:new, :create, :show, :payment_pdf, :next_step, :thankyou]

  def index
    payments
  end

  def show
    @signature = Sign.new(payment_id: payment.id)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.token = generated_token
    if @payment.save
      gflash success: "Payments was successfully created."



      # send email with the link to sign the payment
      PaymentMailer.payment_confirmation(@payment).deliver
      
      redirect_to next_step_payment_path(@payment)
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

  def payment_pdf
    render pdf: "#{@payment.product_name}"
  end

  def next_step; end

  def thankyou; end

private

  def payment
    @payment = Payment.friendly.find(params[:id])
  end

  def payments
    @payments ||= Payments.order(created_at: :desc).page(params[:page])
  end

  def verify_token
    unless payment.token == params[:signature_token]
      gflash error: 'Unauthorized access!!'
      redirect_to root_path
    end
  end

  def payment_params
    params.require(:payment)
          .permit(
              :product_name,
              :customer_name,
              :address,
              :city,
              :state,
              :post_code,
              :country,
              :phone,
              :email,
              :card_number,
              :amount
          )
  end
end
