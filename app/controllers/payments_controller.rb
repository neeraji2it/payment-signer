class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = Payment.all.page(params[:page])
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def edit
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

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
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
