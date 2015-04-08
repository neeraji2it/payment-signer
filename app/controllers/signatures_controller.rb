class SignaturesController < ApplicationController

  def create
    @signature = Sign.new(signature_params)

    if @signature.save!
      @signature.payment.update(is_signed: true)
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
