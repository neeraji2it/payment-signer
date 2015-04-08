class SignaturesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:create]

  def create
    @signature = Sign.new(signature_params)

    if @signature.save!
      @signature.payment.update(is_signed: true, token: generated_token)

      # send email with the link to sign the payment
      PaymentMailer.payment_pdf(@signature.payment).deliver

      gflash success: "You have successfully confirm the payment.\n Please check your email"
      redirect_to root_path
    else
      gflash error: @signature.errors.full_messages.join("<br />").html_safe
      redirect_to :back
    end
  end

private
  
  def signature_params
    params.require(:sign).permit(:signature, :payment_id)
  end
end
